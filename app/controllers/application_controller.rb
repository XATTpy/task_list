class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    before_action :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
    end

    private
 
    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end
end
