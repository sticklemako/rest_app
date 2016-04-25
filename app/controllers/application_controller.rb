class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_params, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  protected

  def configure_permitted_params
      devise_parameter_sanitizer.for(:account_update) << :email
      devise_parameter_sanitizer.for(:sign_up) << :email
  end
end
