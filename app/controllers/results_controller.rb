class ResultsController < ApplicationController

  # skip_before_action :authenticate_user!, raise: false

  def index
  end

  def search

    @student = Student.find_by(
      roll_no: params[:roll_no]
    )

    unless @student
      flash.now[:alert] = "Student not found."
      render :index
      return
    end

    @marks = StudentMark
          .joins(subject: :department_semester)
          .where(student_id: @student.id)
          .select(
            "subjects.subject_code",
            "subjects.subject_name",
            "department_semesters.semester_no",
            "student_marks.final_internal",
            "student_marks.external_exam",
            "student_marks.final_total",
            "student_marks.grade",
            "student_marks.gpa",
            "student_marks.result"
          )
          .order("department_semesters.semester_no")
          .to_a

    @summary = {
      total_subjects: @marks.count,
      passed_subjects: @marks.count { |m| m.result == "PASS" },
      failed_subjects: @marks.count { |m| m.result == "FAIL" },
      average_gpa: (@marks.map(&:gpa).sum / @marks.count.to_f).round(2),
      result: @marks.any? { |m| m.result == "FAIL" } ? "FAIL" : "PASS"
    }

  end

end