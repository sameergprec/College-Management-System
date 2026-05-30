class StudentMark < ApplicationRecord

  belongs_to :student
  belongs_to :subject

  before_save :calculate_marks

  def calculate_marks

    self.i1_total =
      i1_assignment.to_i +
      i1_assessment.to_i +
      i1_ethics.to_i +
      i1_classwork.to_i

    self.i2_total =
      i2_assignment.to_i +
      i2_assessment.to_i +
      i2_ethics.to_i +
      i2_classwork.to_i

    self.best_internal =
      [i1_total, i2_total].max

    self.least_internal =
      [i1_total, i2_total].min

    self.final_internal =
      (best_internal * 0.75) +
      (least_internal * 0.25)

    self.final_total =
      final_internal +
      external_exam.to_f

    calculate_grade
  end

  def calculate_grade

     # EXTERNAL CUTOFF CONDITION
    if external_exam.to_f < 28
      self.grade = "F"
      self.gpa = 0
      self.result = "FAIL"
      return
    end

    case final_total

    when 95..100
      self.grade = "A++"
      self.gpa = 10
      self.result = "PASS"

    when 90...95
      self.grade = "A+"
      self.gpa = 9.5
      self.result = "PASS"

    when 80...90
      self.grade = "A"
      self.gpa = 9
      self.result = "PASS"

    when 70...80
      self.grade = "B"
      self.gpa = 8
      self.result = "PASS"

    when 60...70
      self.grade = "C"
      self.gpa = 7
      self.result = "PASS"

    when 50...60
      self.grade = "D"
      self.gpa = 6
      self.result = "PASS"

    when 40...50
      self.grade = "E"
      self.gpa = 5
      self.result = "PASS"

    else
      self.grade = "F"
      self.gpa = 0
      self.result = "FAIL"
    end

  end

  def i1_total
    i1_assignment.to_i +
    i1_assessment.to_i +
    i1_ethics.to_i +
    i1_classwork.to_i
  end

  def i2_total
    i2_assignment.to_i +
    i2_assessment.to_i +
    i2_ethics.to_i +
    i2_classwork.to_i
  end

end