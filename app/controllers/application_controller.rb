class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  protected

  def after_sign_in_path_for(resource)
    # You can specify a custom path here. For example:
    if resource.is_a?(Admin)
      admin_dashboard_path  # Redirect to admin dashboard if user is an Admin
    elsif resource.is_a?(Visitor)
      visitor_dashboard_path  # Redirect to visitor dashboard if user is a Visitor
    else
      super  # Default to the root path or the path Devise would normally use
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
  end
end
