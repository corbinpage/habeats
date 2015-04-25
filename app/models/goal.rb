class Goal < ActiveRecord::Base
  belongs_to :users
  has_many :days
  # attr_protected 

  def self.get_display
    goals = Goal.all.order(id: :asc)
    goals.collect! {|g| g.days = g.days.chronologically.limit(90); g}
  end

  def add_today
    if self.days.where(date: Date.today).empty?
      self.add_date(Date.today)
    end
  end

  def add_date(date_val, score=0)
    day_obj = Day.new
    day_obj.set_date(date_val)
    day_obj.score = score
    day_obj.set_range
    day_obj.goal_id = self.id
    day_obj.save    
  end

  def initialize_days
    count_back = (0..95).to_a
    self.days = count_back.map do |i| 
      Day.create(Date.today - 95 + i)
    end
  end

  def days
    @days ||= Day.where(goal_id: self.id).chronologically
  end

end
