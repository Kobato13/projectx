class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.role == "member"
      root_path
    elsif resource.role == "admin"
      admin_root_path
    elsif resource.role == "super_admin"
      super_admin_root_path
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
