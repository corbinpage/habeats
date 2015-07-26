class Progress < ActiveRecord::Base
  belongs_to :goals
  # attr_protected
  # scope :chronologically, -> { order(date: :desc) } 

  @@blue_range_colors = ["#EEEEEE","#9FC1F8","#4587F6","#376BC3","#214177"]
  @@green_range_colors = ["#EEEEEE","#D6E685","#8CC665","#44A340","#1E6823"]

  def self.mark(goal_id, date_val, action)
    progress_obj = Progress.where('goal_id = :goal_id AND date = :date',
                                  {goal_id: goal_id, date: date_val})
    progress_obj = progress_obj.empty? ? Progress.create(goal_id, date_val) : progress_obj[0]
    progress_obj.process_action(action)

    progress_obj      
  end

  def self.create(goal_id, date_val, score=0)
    progress_obj = Progress.new(goal_id: goal_id, score: score)
    progress_obj.set_date(date_val)
    progress_obj.set_range

    progress_obj  
  end

  def process_action(action_txt)
    if(action_txt=="add")
      self.add_score
    elsif(action_txt=="subtract")
      self.subtract_score
    end
  end

  def add_score
    self.score+=1
    set_range
  end

  def subtract_score
    if self.score >= 1
      self.score-=1
    end
    set_range
  end

  def set_range
    if self.score==0
      self.range_value=0
    elsif self.score==1
      self.range_value=1
    elsif self.score>=2 && self.score<=4
      self.range_value=2
    elsif self.score>4 && self.score<=7
      self.range_value=3
    elsif self.score>7
      self.range_value=4
    else
      self.range_value=0
    end
    self.range_color = @@blue_range_colors[self.range_value]
  end

  def set_date(date_val)
    self.date = Date.strptime(date_val, '%m-%d-%Y') 
    self.dofw = (self.date.wday == 0 ? 7 : self.date.wday)
    self.week_num = (self.date.year.to_s + self.date.cweek.to_s.rjust(2,"0")).to_i
  end

  def self.generate_display_days
    count_back = (0..95).to_a
    count_back.map do |i| 
      Day.create_empty(Date.today - 95 + i)
    end
  end

end