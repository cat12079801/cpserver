class Problem < ApplicationRecord
  has_many :submits, dependent: :destroy
  has_many :test_cases, dependent: :destroy

  def solve_count
    self.submits.where(status: "AC").pluck(:user_id).uniq.length
  end

  def solved? user
    self.submits.where(status: "AC", user: user).empty?.!
  end
end
