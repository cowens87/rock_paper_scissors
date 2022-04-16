class CreateExcursion < ActiveRecord::Migration[5.2]
  def change
    create_table :excursions do |t|
      t.string :title
      t.string :description
      t.string :location
      t.references :user
      
      t.timestamps
    end
  end
end
