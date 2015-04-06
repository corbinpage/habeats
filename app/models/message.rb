class Message < ActiveRecord::Base
  belongs_to :job
  has_many :attachments

  accepts_nested_attributes_for :attachments

  scope :client, -> { where(location_submitted: Message::CLIENT_EMAIL_LOCATIONS ).where(job_id: nil)}
  default_scope { order("created_at ASC") }

  CLIENT_EMAIL_LOCATIONS = ["submit_job", "email", "contact_us"]
  PROOFREADER_EMAIL_LOCATIONS = ["proofreader_sent"]

  def self.notify_proofreaders
    proofreaders = User.where(role: '1')
    proofreaders.each do |proofreader|
      data = {:from     => ENV['support_email'],
              :to       => proofreader.email,
              :subject  => "New Job Received",
              :text     => "We have received a new job, visit #{ENV['domain']}/all_jobs to claim it."
             }
      mg_client = Mailgun::Client.new ENV["mailgun_key"]
      mg_client.send_message(ENV['mailgun_domain'], data)
    end
  end

  def receive_from_site(attributes = {})
    attributes.each do |name, value|
      if name == "attachment"
        attributes["attachment"].each do |attachment_params|
          attachment = Attachment.new
          attachment.upload(attachment_params)
          self.attachments << attachment
        end
      else
        send("#{name}=", value)
      end
    end
    self.location_submitted = "contact_us"
    self.save
  end

  def receive_from_mailgun(params)
    attachments = set_mailgun_params_return_attachments(params)

    if !params["In-Reply-To"]
      if user = find_user
        create_job_add_user(attachments, user)
      else
        self.attachments << attachments
      end
    else
      classify_reply(params["In-Reply-To"], attachments)
    end

    self.save
  end

  def attach_documents(attributes = {})
    if attributes && attributes["0"]["attachment"]
      attributes["0"]["attachment"].each do |file|
        attachment = Attachment.new
        attachment.upload(file)
        self.attachments << attachment
      end
    end
  end

  def set_mailgun_params_return_attachments(params)
    self.subject    = params['subject']
    self.name       = params['from'].gsub(/<+\S*/, "")
    self.email      = params['sender']
    self.body       = params['stripped-text']
    self.mailgun_id = params['Message-Id']
    self.mailgun_reply_to_id = params['In-Reply-To']
    self.location_submitted  = 'email'

    attachments = []
    params['attachment-count'].to_i.times do |i|
      attachment = Attachment.new
      attachment.upload(params["attachment-#{i+1}"])
      attachments << attachment
    end
    attachments
  end

  def classify_reply(in_reply_to, attachments)
    original_message = Message.find_by(mailgun_id: in_reply_to)
    if original_message.job
      self.job = original_message.job
      self.attachments << attachments
    else
      self.attachments << attachments
    end
  end

  def find_user
    User.find_by(email: self.email)
  end

  def find_replys
    Message.where(mailgun_reply_to_id: self.mailgun_id).where.not(mailgun_reply_to_id: nil)
  end

  def create_job_add_user(attachments, user)
    self.job = Job.new
    self.job.user = user
    self.job.create_tasks
    self.attachments << attachments
  end

  def send_email(data)
    mg_client = Mailgun::Client.new ENV["mailgun_key"]
    result = mg_client.send_message(ENV['mailgun_domain'], data).to_h!
    self.mailgun_id = result['id']
    self.mailgun_response = result['message']
    self.subject = data[:subject]
    self.body = data[:text]
    self.location_submitted = "proofreader_sent"
  end

end
