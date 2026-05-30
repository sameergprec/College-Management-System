class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def debug_users
    render plain: "User count = #{User.count} | First user = #{User.first&.email}"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :department_id])
  end

  def after_sign_in_path_for(resource)
    case resource.role
    when 'student'
      students_dashboard_path
    when 'teacher'
      teachers_dashboard_path
    when 'department'
      departments_dashboard_path
    when 'admin'
      admins_dashboard_path
    else
      root_path
    end
  end
end
