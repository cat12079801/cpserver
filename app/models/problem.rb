class Problem < ApplicationRecord
  has_many :submits, dependent: :destroy
  has_many :test_cases, dependent: :destroy
end
