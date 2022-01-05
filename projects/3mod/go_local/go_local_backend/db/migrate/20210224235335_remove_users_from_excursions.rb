class RemoveUsersFromExcursions < ActiveRecord::Migration[5.2]
  def change
    remove_column :excursions, :user_id
  end
end
