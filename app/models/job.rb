class Job < ActiveRecord::Base
  belongs_to :user
  has_many   :messages
  has_many   :tasks

  accepts_nested_attributes_for :messages

  default_scope { order("created_at DESC") }

  JOB_TYPES = ["Revisions", "Cold Reading", "Word for Word", "Document Conversions", "Copyediting", "Cross Reference", "EDGAR/XBRL", "Other", "I am not sure"]

  # TODO: I would like to move these methods to scopes in lower level model, but I have trouble with calling method on A/R Objects
  # Also not scopes becacsue they are not exisiting on the Class level of the object.
  def new_messages
    self.messages.where(mailgun_reply_to_id: nil) 
  end

  # TODO: Shouldn't use map when I could use joins
  def client_attachments
    self.messages.where(location_submitted: Message::CLIENT_EMAIL_LOCATIONS).collect { |message| message.attachments }.flatten
  end

  def finished_attachments
    self.tasks.where(task_type: "proofreader_check").collect { |task| task.attachments }.flatten
  end

  def get_timers
    self.tasks.collect { |task| task.timers }.flatten
  end

  def create_tasks
    self.tasks << Task.create_tasks
  end

  def email_on_job_creation
    message = Message.new
    data = {:from     => ENV['support_email'],
            :to       => self.user.email,
            :subject  => "Project Double Check - Job ##{self.id} Received",
            :text     => "Thank you for submmiting a job at Project Double Check. You can view your job anytime at #{ENV['domain']}/users/#{self.user.id}/jobs/#{self.id}. If you would like to add any additional information about your job, please reply to this email."
           }
    message.send_email(data)
    self.messages << message
    self.save
  end

  def send_complete_email(messages_attributes, email_attachments)
    message = Message.new
    
    data = {:from     => ENV['support_email'],
            :to       => self.user.email,
            :subject  => messages_attributes["messages_attributes"]["0"]["subject"],
            :text     => messages_attributes["messages_attributes"]["0"]["body"]
           }
           
    # Check boolean to send emails
    if email_attachments == ["1"]
      self.finished_attachments.each do |attachment|
        open("#{Rails.root}/tmp/#{attachment.attachment_file_name}", "wb") do |file|
          file << open(attachment.attachment.url).read
          data[:attachment] = File.open(file)
        end
      end
    end
    
    message.send_email(data)
    self.messages << message
    self.save
  end

  def mark_complete
    self.complete = true
    self.completed_at = Time.now
  end

  def calculate_total_task_timers
    job_timers = get_timers
    total_time = 0.0
    job_timers.each do |timer|
      unit = timer.end_time - timer.start_time
      total_time += unit
    end
    self.total_time = total_time
    self.save
  end

end