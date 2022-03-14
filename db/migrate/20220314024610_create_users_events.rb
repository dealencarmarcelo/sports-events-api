class CreateUsersEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :users_events do |t|
      t.references :user, foreign_key: true, index: true
      t.references :event, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
