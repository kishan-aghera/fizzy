class RemoveFkConstraintsFromAssignments < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :assignments, :bubbles
    remove_foreign_key :assignments, :users
  end
end
