class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    if resource.role == "member"
      member_root_path
    elsif resource.role == "admin"
      admin_root_path
    elsif resource.role == "super_admin"
      rails_admin_path
    end
  end

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end

end
