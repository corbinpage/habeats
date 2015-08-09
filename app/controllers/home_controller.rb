class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :try_it, :add_guest]

  def index
    if user_signed_in?
      @goals = Goal.get_display_progress(current_user)
      render action: "_portal"
    else
      render action: "_try_it"
    end
  end

  def portal
    @goals = Goal.get_display_progress(current_user)
  end

  def try_it
  end

  def add_guest
    sign_in(:user, User.create_guest)
    @goals = []
    render action: "_portal"
  end

end