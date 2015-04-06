class Attachment < ActiveRecord::Base
  belongs_to :task
  belongs_to :message
  has_attached_file :attachment, :path => "attachments/:id"
  
  do_not_validate_attachment_file_type :attachment

  def upload(attachment_params)
    self.attachment = attachment_params
  end

end