class Day < ActiveRecord::Base
  belongs_to :days
  # attr_protected
  scope :chronologically, -> { order(id: :desc) } 

  @@blue_range_colors = ["#eee","#9FC1F8","#4587F6","#376BC3","#214177"]
  @@green_range_colors = ["#eee","#d6e685","#8cc665","#44a340","#1e6823"]

  def add_score
    self.score+=1
    set_range
  end

  def subtract_score
    self.score-=1
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
    self.date = date_val
    self.dofw = (self.date.wday == 0 ? 7 : self.date.wday)
    self.week_num = (self.date.year.to_s + self.date.cweek.to_s.rjust(2,"0")).to_i
  end


end

