class InternalMark < ApplicationRecord
  belongs_to :subject

  before_save :calculate_totals

  def calculate_totals
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

    self.best_internal = [i1_total, i2_total].max
    self.least_internal = [i1_total, i2_total].min

    self.final_internal =
      (best_internal * 0.75) +
      (least_internal * 0.25)
  end
end