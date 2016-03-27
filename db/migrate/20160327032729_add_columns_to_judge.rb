class AddColumnsToJudge < ActiveRecord::Migration[5.0]
  def change
    add_column :judges, :paiza_error_msg, :string
    add_column :judges, :paiza_build_stderr, :string
    add_column :judges, :paiza_stderr, :string
    add_column :judges, :paiza_time, :string
    add_column :judges, :paiza_memory, :integer
    add_column :judges, :paiza_result, :string
  end
end
