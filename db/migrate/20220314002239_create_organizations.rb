class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.references :organizer, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
