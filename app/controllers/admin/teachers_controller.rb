class Admin::TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin!

  def index
    @teachers = Teacher.all
  end

  def show; end

  def new
    @teacher = Teacher.new
    @available_users = User.where(role: "teacher").where.not(id: Teacher.pluck(:user_id))
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @available_users = User.where(role: "teacher").where.not(id: Teacher.pluck(:user_id))

    if @teacher.save
      redirect_to admin_teacher_path(@teacher), notice: "Teacher created successfully."
    else
      render :new
    end
  end

  def edit
    # Include current teacher's user_id to avoid exclusion during editing
    @available_users = User.where(role: "teacher")
                           .where.not(id: Teacher.where.not(id: @teacher.id).pluck(:user_id))
                           .or(User.where(id: @teacher.user_id))
  end

  def update
    @available_users = User.where(role: "teacher")
                           .where.not(id: Teacher.where.not(id: @teacher.id).pluck(:user_id))
                           .or(User.where(id: @teacher.user_id))

    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher), notice: "Teacher updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to admin_teachers_path, notice: "Teacher deleted successfully."
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(
      :id_number, :name, :doj, :department_id, :qualifications, :specialization, :user_id
    )
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user.role == "admin"
  end
end
