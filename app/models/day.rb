class Day < ActiveRecord::Base
  belongs_to :days
  # attr_protected

  @@range_colors = ["#aaa","#bbb","#ccc","#ddd","#eee"]

  def add_score
    self.score+=1
    # Adjust range_value
    set_range_color
  end

  def subtract_score
    self.score-=1
    # Adjust range_value
    set_range_color
  end

  private
    def set_range_color
      self.range_color = @@range_colors[self.range_value]
    end

end
