class Problem < ApplicationRecord
  has_many :test_cases, dependent: :destroy
end