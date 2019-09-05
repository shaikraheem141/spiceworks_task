class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :authenticate_user!

    layout :layout_by_resource

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || questions_path
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
    end

    private
    def layout_by_resource
        is_a?(Devise::SessionsController || Devise::RegistrationsController) ? false : 'application'
    end
end
