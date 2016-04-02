class AddColumnToTestCase < ActiveRecord::Migration[5.0]
  def change
    add_column :test_cases, :sample, :boolean, null: false, default: false
  end
end
