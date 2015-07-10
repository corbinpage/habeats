class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index
  skip_before_filter :only_proofreaders!, :only => :index
  
  def index
    @goals = Goal.get_display
  end

  def index2
    @goals = Goal.get_display
    @goals_progress = Goal.get_display_progress
    puts @goals_progress.first.progresses.inspect
  end

end