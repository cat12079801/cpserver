class ChangeColumnToJudge < ActiveRecord::Migration[5.0]
  def up
    change_column :judges, :paiza_error_msg, :text
    change_column :judges, :paiza_build_stderr, :text
    change_column :judges, :paiza_stderr, :text
    add_column    :judges, :output, :text
  end

  def down
    change_column :judges, :paiza_error_msg, :string
    change_column :judges, :paiza_build_stderr, :string
    change_column :judges, :paiza_stderr, :string
    remove_column :judges, :output, :text
  end
end
