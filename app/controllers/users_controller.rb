class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def manage
    @user = User.find(params[:id])
    @jobs = @user.jobs.paginate(:page => params[:page], :per_page => 10)
  end

  def management_update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to manage_user_path(@user), :notice => "Profile Updated"
    else
      render 'manage'
    end
  end

  private

  def user_params
    params.require(:user)
  end
  
end