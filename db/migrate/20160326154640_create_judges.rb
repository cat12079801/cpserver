class CreateJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|
      t.belongs_to :submit, foreign_key: true
      t.belongs_to :test_case, foreign_key: true
      t.string :status, null: false, default: "Judging"
      t.string :paiza_api_id, null: false

      t.timestamps
    end
  end
end
