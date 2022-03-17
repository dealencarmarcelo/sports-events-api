class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.string :unit, null: false

      t.float :value, null: false

      t.timestamps
    end
  end
end
