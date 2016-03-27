class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :submits, dependent: :destroy

  def email_required?
    false
  end
end
