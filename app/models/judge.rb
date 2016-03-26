class Judge < ApplicationRecord
  belongs_to :submit
  belongs_to :test_case
end
