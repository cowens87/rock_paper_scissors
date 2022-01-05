class ChangeIndexToForeignKeyOnExcursions < ActiveRecord::Migration[5.2]
  def change
    remove_column :excursions, :user_id
    add_reference :excursions, :user, foreign_key: true
  end
end
