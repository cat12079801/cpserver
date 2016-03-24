class CreateSubmits < ActiveRecord::Migration[5.0]
  def change
    create_table :submits do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :language, foreign_key: true
      t.belongs_to :problem, foreign_key: true
      t.text :code
      t.string :status, null: false, default: "WJ"

      t.timestamps
    end
  end
end
