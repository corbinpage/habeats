class Timer < ActiveRecord::Base
  belongs_to :proofreader, class_name: "User", foreign_key: "proofreader_id"
  belongs_to :task

  def start_timer(current_user)
    self.start_time  = Time.now
    self.proofreader = current_user
  end

  def end_timer
    self.end_time = Time.now
    self.save
  end

end