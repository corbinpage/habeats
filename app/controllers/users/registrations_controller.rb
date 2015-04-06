class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  skip_before_filter :only_proofreaders!, only: [:edit, :update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << [:name, :telephone]
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << [:name, :telephone]
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    procedures_path(resource)
  end

  def after_update_path_for(resource)
    procedures_path(resource)
  end

  # TODO: This could be used for a bad credit card or no credits, left this month
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
