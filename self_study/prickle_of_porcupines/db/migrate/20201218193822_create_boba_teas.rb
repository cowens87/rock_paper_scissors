class CreateBobaTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :boba_teas do |t|
      t.string :image, allow: :null
      t.string :name
      t.float :price
      t.string :base
      t.boolean :caffeinated
      t.string :description
      t.references :teahouse, foreign_key: true
    end
  end
end
