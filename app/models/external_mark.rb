class ExternalMark < ApplicationRecord
  belongs_to :subject

  before_save :calculate_final_total

  def calculate_final_total
    internal = subject.internal_mark.final_internal

    self.final_total =
      internal + external_exam.to_f

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

end
