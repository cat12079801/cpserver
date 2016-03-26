class Submit < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :problem
  has_many :judges, dependent: :destroy
end
