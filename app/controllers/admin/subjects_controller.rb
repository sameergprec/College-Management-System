class Admin::SubjectsController < ApplicationController

  def index
    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(
        params[:department_semester_id]
      )

    @subjects =
      @department_semester.subjects
  end

  def new
    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(
        params[:department_semester_id]
      )

    @subject =
      @department_semester.subjects.new
  end

  def create
    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(
        params[:department_semester_id]
      )

    @subject =
      @department_semester.subjects.new(
        subject_params
      )

    if @subject.save
      redirect_to admin_department_department_semester_subjects_path(
        @department,
        @department_semester
      )
    else
      render :new
    end
  end

  def edit

  @department = Department.find(params[:department_id])

  @department_semester =
    DepartmentSemester.find(
      params[:department_semester_id]
    )

  @subject = Subject.find(params[:id])

  end

  def update

    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(
        params[:department_semester_id]
      )

    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)

      redirect_to admin_department_department_semester_subjects_path(
        @department,
        @department_semester
      )

    else
      render :edit
    end

  end

  def destroy

    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(
        params[:department_semester_id]
      )

    @subject = Subject.find(params[:id])

    @subject.destroy

    redirect_to
    admin_department_department_semester_subjects_path(
      @department,
      @department_semester
    )

  end

  def mark_entry

    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(params[:department_semester_id])

    @subject = Subject.find(params[:id])

    @students = Student.where(
      department_id: @department.id,
      semester: @department_semester.semester_no
    )

    @marks =
      StudentMark.where(subject_id: @subject.id)
                .index_by(&:student_id)

  end
  

  def show_marks

    @department = Department.find(params[:department_id])

    @department_semester =
      DepartmentSemester.find(params[:department_semester_id])

    @subject = Subject.find(params[:id])

    @marks =
      StudentMark.where(subject_id: @subject.id)
                .includes(:student)

  end

  private

  def subject_params
    params.require(:subject).permit(
      :subject_code,
      :subject_name,
      :credits,
      :subject_type
    )
  end
end