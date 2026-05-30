class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_department!
  
  def dashboard
    @department = current_user.department
  end

  def students
    @students = Student.where(department_id: current_user.department_id)
  end

  def teachers
    @teachers = Teacher.where(department_id: current_user.department_id)
  end

  private

  def authorize_department!
    unless current_user.role == 'department'
      redirect_to root_path, alert: "Access Denied"
    end
  end
end
