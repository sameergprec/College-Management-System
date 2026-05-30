class Admin::DepartmentSemestersController < ApplicationController

  def index
    @department = Department.find(params[:department_id])
    @department_semesters =
      @department.department_semesters
  end

  def new
    @department = Department.find(params[:department_id])

    @department_semester =
      @department.department_semesters.new
  end

  def create
    @department = Department.find(params[:department_id])

    @department_semester =
      @department.department_semesters.new(
        department_semester_params
      )

    if @department_semester.save
      redirect_to admin_department_department_semesters_path(
        @department
      )
    else
      render :new
    end
  end

  def edit

    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(params[:id])

  end

  def update

    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(params[:id])

    if @department_semester.update(
        department_semester_params
      )

      redirect_to
      admin_department_department_semesters_path(
        @department
      )

    else
      render :edit
    end

  end

  def destroy

    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(params[:id])

    @department_semester.destroy

    redirect_to
    admin_department_department_semesters_path(
      @department
    )

  end

  private

  def department_semester_params
    params.require(:department_semester).permit(
      :semester_no
    )
  end
end