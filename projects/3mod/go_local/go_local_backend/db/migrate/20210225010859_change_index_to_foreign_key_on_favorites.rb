class ChangeIndexToForeignKeyOnFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :user_id
    add_reference :favorites, :user, foreign_key: true
  end
end
