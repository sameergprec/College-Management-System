# example: app/controllers/admin/students_controller.rb
class Admin::StudentsController < ApplicationController
  def index
    @students = Student.all
    @departments = Department.all
  end

  def department_students
    @department = Department.find(params[:department_id])

    if params[:show] == "all"

      @students = Student.includes(:department, :user)

      if params[:department_id].present?
        @students = @students.where(department_id: params[:department_id])
      end

    else

      @students = Student.where(department_id: @department.id)

    end

    @students = @students.where(semester: params[:semester]) if params[:semester].present?

    @students = @students.where(section: params[:section]) if params[:section].present?
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_student_path(@student), notice: 'Student was successfully created.'
    else
      puts @student.errors.full_messages # Add this line to log the actual error
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_student_path(@student), notice: "Student updated."
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_students_path, notice: "Student deleted."
  end

  private

  def student_params
    params.require(:student).permit(:roll_no, :name, :father_name, :mother_name, :dob, :semester, :section, :course, :scheme, :address, :department_id, :user_id, :profile_picture)
  end
end
