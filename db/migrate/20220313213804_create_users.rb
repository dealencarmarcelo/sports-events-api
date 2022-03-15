class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, index: true, unique: true
      t.string :username, index: true, unique: true
      t.string :role, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
