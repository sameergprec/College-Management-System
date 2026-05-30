class Admin::AcademicDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_academic_detail, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin!

  def index
    @academic_details = AcademicDetail.includes(:student).all
  end

  def show; end


  def new
    student_id = params[:student_id]

    if student_id.present? && AcademicDetail.exists?(student_id: student_id)
      redirect_to edit_admin_academic_detail_path(AcademicDetail.find_by(student_id: student_id)), alert: "Academic detail for this student already exists."
    else
      @academic_detail = AcademicDetail.new(student_id: student_id)
    end
  end


  def create
    @academic_detail = AcademicDetail.new(academic_detail_params)
    calculate_cgpa(@academic_detail)

    if @academic_detail.save
      redirect_to admin_academic_detail_path(@academic_detail), notice: "Academic record created."
    else
      render :new
    end
  end

  def update
    @academic_detail.assign_attributes(academic_detail_params)
    calculate_cgpa(@academic_detail)

    if @academic_detail.save
      redirect_to admin_academic_detail_path(@academic_detail), notice: "Academic record updated."
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @academic_detail.destroy
    redirect_to admin_academic_details_path, notice: "Academic record deleted."
  end

  private

  def set_academic_detail
    @academic_detail = AcademicDetail.find(params[:id])
  end

  def academic_detail_params
    params.require(:academic_detail).permit(
      :student_id, :i_sem, :ii_sem, :iii_sem, :iv_sem,
      :v_sem, :vi_sem, :vii_sem, :viii_sem, :cgpa
    )
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user.role == "admin"
  end

  def calculate_cgpa(record)
    semesters = [
      record.i_sem, record.ii_sem, record.iii_sem,
      record.iv_sem, record.v_sem, record.vi_sem,
      record.vii_sem, record.viii_sem
    ].compact

    if semesters.any?
      record.cgpa = (semesters.sum / semesters.size).round(2)
    else
      record.cgpa = nil
    end
  end
end
