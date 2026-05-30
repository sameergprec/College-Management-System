class SemestersController < ApplicationController

  def index
    @student = Student.find(params[:student_id])
    @semesters = @student.semesters
  end

  def show
    @semester = Semester.find(params[:id])
  end

  def new
    @student = Student.find(params[:student_id])
    @semester = @student.semesters.new
  end

  def create
    @student = Student.find(params[:student_id])

    @semester =
      @student.semesters.new(semester_params)

    if @semester.save
      redirect_to student_semester_path(
        @student,
        @semester
      )
    else
      render :new
    end
  end

  private

  def semester_params
    params.require(:semester).permit(
      :semester_no,
      :academic_year
    )
  end
end