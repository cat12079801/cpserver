class ChangeOutputColumnToJudge < ActiveRecord::Migration[5.0]
  def change
    rename_column :judges, :output, :paiza_stdout
  end
end
