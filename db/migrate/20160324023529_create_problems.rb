class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.string :name, null: false
      t.text :question, null: false
      t.integer :point, null: false
      t.boolean :opened, null: false, default: false

      t.timestamps
    end
  end
end
