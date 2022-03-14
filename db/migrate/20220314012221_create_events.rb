class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :host, index: true, foreign_key: { to_table: :organizations }
      t.references :sport, index: true, foreign_key: true
      t.string :country

      t.timestamps
    end
  end
end
