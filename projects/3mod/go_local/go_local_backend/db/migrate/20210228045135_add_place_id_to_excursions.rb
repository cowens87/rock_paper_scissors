class AddPlaceIdToExcursions < ActiveRecord::Migration[5.2]
  def change
    add_column :excursions, :place_id, :string
  end
end
