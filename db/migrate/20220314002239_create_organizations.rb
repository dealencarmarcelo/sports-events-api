class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :code, null: false, index: true, unique: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
