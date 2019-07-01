class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:colegio_id, :departamento_id, :nombre])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:colegio_id, :departamento_id, :nombre])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:colegio_id])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:colegio_id])
  end
end
