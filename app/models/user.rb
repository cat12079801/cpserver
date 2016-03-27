class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :submits, dependent: :destroy

  def email_required?
    false
  end

  def point
    ac_problems = self.submits.select("status, problem_id").where(status: "AC").pluck(:problem_id).uniq
    Problem.where(id: ac_problems).sum(:point)
  end
end
