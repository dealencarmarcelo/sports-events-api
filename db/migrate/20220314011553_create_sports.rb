class CreateSports < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :win_condition

      t.boolean :has_attempts
      
      t.integer :max_attempts

      t.timestamps
    end
  end
end
