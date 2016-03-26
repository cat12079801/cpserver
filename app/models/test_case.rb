class TestCase < ApplicationRecord
  belongs_to :problem
  has_many :judges, dependent: :destroy
end
