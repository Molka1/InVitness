class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :location, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :location, :email, :password, :current_password)
    end
  end
  def default_url_options
    { host: ENV["www.invitness.com"] || "localhost:3000" }
  end
end
