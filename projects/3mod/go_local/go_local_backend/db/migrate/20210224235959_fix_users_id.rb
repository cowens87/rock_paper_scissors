class FixUsersId < ActiveRecord::Migration[5.2]
  def change
    rename_column :excursions, :users_id, :user_id
  end
end
