class Admin::DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show; end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to admin_department_path(@department), notice: "Department created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @department.update(department_params)
      redirect_to admin_department_path(@department), notice: "Department updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to admin_departments_path, notice: "Department deleted successfully."
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name,:code)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user.role == "admin"
  end
end
