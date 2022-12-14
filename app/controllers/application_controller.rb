class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :avatar])

  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name, :cpf, :re, :phone, :company_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name, :cpf, :re, :phone, :company_id])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
