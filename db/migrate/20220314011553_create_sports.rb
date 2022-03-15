class CreateSports < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :win_condition, null: false

      t.boolean :has_attempts, null: false, default: false
      
      t.integer :max_attempts, null: false, default: 1

      t.timestamps
    end
  end
end
