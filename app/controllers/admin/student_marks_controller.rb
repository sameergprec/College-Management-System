class Admin::StudentMarksController < ApplicationController

  def index
    @department = Department.find(params[:department_id])
    @department_semester = DepartmentSemester.find(params[:department_semester_id])
    @subject = Subject.find(params[:subject_id])

    # ONLY STUDENTS OF CURRENT SEMESTER
    @students = Student.where(
      department_id: @department.id,
      semester: @department_semester.semester_no
    )

    @marks = StudentMark.where(subject_id: @subject.id).index_by(&:student_id)
  end


  def create
    @department = Department.find(params[:department_id])
    @department_semester = DepartmentSemester.find(params[:department_semester_id])
    @subject = Subject.find(params[:subject_id])

    @student_mark = StudentMark.find_or_initialize_by(
      student_id: student_mark_params[:student_id],
      subject_id: @subject.id
    )

    if @student_mark.update(student_mark_params)

      flash[:notice] = "Marks saved successfully ✅"

      redirect_to show_marks_admin_department_department_semester_subject_path(
        @department,
        @department_semester,
        @subject
      )

    else

      flash[:alert] = "Failed to save marks ❌"

      redirect_to mark_entry_admin_department_department_semester_subject_path(
        @department,
        @department_semester,
        @subject
      )

    end
  end


  def update
    @department = Department.find(params[:department_id])
    @department_semester = DepartmentSemester.find(params[:department_semester_id])
    @subject = Subject.find(params[:subject_id])

    @student_mark = StudentMark.find(params[:id])

    if @student_mark.update(student_mark_params)

      flash[:notice] = "Marks updated successfully ✅"

      redirect_to show_marks_admin_department_department_semester_subject_path(
        @department,
        @department_semester,
        @subject
      )

    else

      flash[:alert] = "Update failed ❌"

      redirect_to mark_entry_admin_department_department_semester_subject_path(
        @department,
        @department_semester,
        @subject
      )

    end
  end


  def bulk_save

    @department = Department.find(params[:department_id])
    @department_semester = DepartmentSemester.find(params[:department_semester_id])
    @subject = Subject.find(params[:subject_id])

    marks_params = params[:m] || {}

    marks_params.each do |student_id, mark_data|

      student_mark = StudentMark.find_or_initialize_by(
        student_id: student_id,
        subject_id: @subject.id
      )

      student_mark.update(mark_data.permit(:i1_assignment,:i1_assessment,:i1_ethics,:i1_classwork,:i2_assignment,:i2_assessment,:i2_ethics,:i2_classwork,:external_exam))

    end

    flash[:notice] = "All marks saved successfully ✅"

    redirect_to show_marks_admin_department_department_semester_subject_path(
      @department,
      @department_semester,
      @subject
    )

  end


  private

  def student_mark_params
    params.require(:student_mark).permit(
      :student_id,
      :i1_assignment,
      :i1_assessment,
      :i1_ethics,
      :i1_classwork,
      :i2_assignment,
      :i2_assessment,
      :i2_ethics,
      :i2_classwork,
      :external_exam
    )
  end
end