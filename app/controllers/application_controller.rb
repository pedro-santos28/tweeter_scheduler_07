class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?

  protected

    def after_sign_in_path_for(_resource)
      "/auth/twitter2"
    end

    def after_sign_up_path_for(_resource)
      "/auth/twitter2"
    end

    def configure_permitted_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username])
    end
end
