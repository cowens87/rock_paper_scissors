class AddUserRefToExcursions < ActiveRecord::Migration[5.2]
  def change
    add_reference :excursions, :users, index: true
  end
end
