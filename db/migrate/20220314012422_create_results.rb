class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :event, index: true, foreign_key: true
      t.references :participant, index: true, foreign_key: { to_table: :users }

      t.string :unit
      
      t.float :value

      t.timestamps
    end
  end
end
