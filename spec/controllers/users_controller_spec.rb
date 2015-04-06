require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do
    
    # Sample tests from rails-devise app
    # it "should be successful" do
    #   get :show, :id => @user.id
    #   response.should be_success
    # end
    
    # it "should find the right user" do
    #   get :show, :id => @user.id
    #   assigns(:user).should == @user
    # end
    
  end

end
