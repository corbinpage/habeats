class Goal < ActiveRecord::Base
  belongs_to :users
  has_many :progresses
  # attr_protected

  def self.get_display_progress
    goals = Goal.all.order(id: :asc)

    goals.each do |g|
      count_back = (0..95).to_a
      progress_dates = g.progresses.map{|p| p.date}
      g.progresses = count_back.map do |i|
        match_date = Date.today - 95 + i
        match_index = progress_dates.index(match_date)
        if match_index
          g.progresses[match_index]
        else
          Progress.create(g.id,match_date)
        end
      end
    end
  end

  def self.generate_display_days
    count_back = (0..95).to_a
    count_back.map do |i| 
      Day.create_empty(Date.today - 95 + i)
    end
  end

  def initialize_progresses
    count_back = (0..95).to_a
    self.progresses = count_back.map do |i| 
      Progress.create(self.id,Date.today - 95 + i,rand(10))
    end
  end

  def initialize_empty_progresses
    count_back = (0..95).to_a
    self.progresses = count_back.map do |i| 
      Progress.create(self.id,Date.today - 95 + i,0)
    end
  end

end
