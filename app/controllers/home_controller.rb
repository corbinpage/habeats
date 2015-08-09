class HomeController < ApplicationController

  def index
    if user_signed_in?
      @goals = Goal.get_display_progress(current_user)
    else
      @goals = []
    end
  end

  def try_it
    session[:user_id] = User.create_guest.id
    render action: "index"
  end

end