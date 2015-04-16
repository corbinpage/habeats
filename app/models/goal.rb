class Goal < ActiveRecord::Base
  belongs_to :users
  has_many :days
  # attr_protected

  def add_today
    self.add_date(Date.today)  
  end

  def add_date(date_val, score=0)
    day_obj = Day.new
    day_obj.set_date(date_val)
    day_obj.score = score
    day_obj.set_range
    day_obj.goal_id = self.id
    day_obj.save    
  end

end
