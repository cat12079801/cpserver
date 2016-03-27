class Submit < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :problem
  has_many :judges, dependent: :destroy

  def show_status
    if self.status == "Judging"
      "Judging (#{self.judges.length}/#{self.problem.test_cases.length})"
    else
      self.status
    end
  end

  def show_point
    if self.status == "AC"
      self.problem.point
    else
      0
    end
  end
end
