class Task < ActiveRecord::Base
  belongs_to :job
  has_many   :attachments
  has_many   :timers

  TASK_TYPES = ["proofread", "operator", "proofreader_check"]

  Task::TASK_TYPES.each do |task_type|
    scope task_type.to_sym, -> { where(task_type: task_type )}
  end

  def self.create_tasks
    Task::TASK_TYPES.map { |task_type| self.new(task_type: task_type) }.reverse
  end

  def start_timer(current_user)
    timer = Timer.new
    timer.start_timer(current_user)
    self.timers << timer
    self.save
  end

  def attach_documents(attributes = {})
    if attributes["attachment"]
      attributes["attachment"].each do |file|
        attachment = Attachment.new
        attachment.upload(file)
        self.attachments << attachment
      end
      self.save
    end
  end

  def mark_complete
    self.complete = true
    self.job.calculate_total_task_timers
    if self.task_type == "proofreader_check"
      self.job.mark_complete
    end
    self.save
  end

end