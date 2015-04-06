class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :only_proofreaders!

  private
  
  def only_proofreaders!
    if current_user && !current_user.proofreader?
     redirect_to root_path, notice: "Only Proofreaders Can View that page"
    end
  end

end