class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index
  skip_before_filter :only_proofreaders!, :only => :index
  
  def index
    @message = Message.new
  end
  
end