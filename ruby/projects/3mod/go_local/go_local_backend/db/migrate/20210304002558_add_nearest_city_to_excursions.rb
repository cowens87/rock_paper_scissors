class AddNearestCityToExcursions < ActiveRecord::Migration[5.2]
  def change
    add_column :excursions, :nearest_city, :string
  end
end
