class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index
  skip_before_filter :only_proofreaders!, :only => :index
  
  def index
    @goals = Goal.get_display
  end

  def index2
    @goals = Goal.get_display
    @empty_days = Progress.generate_display_days
  end

end