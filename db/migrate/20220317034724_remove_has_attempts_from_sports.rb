class RemoveHasAttemptsFromSports < ActiveRecord::Migration[7.0]
  def change
    remove_column :sports, :has_attempts
  end
end
