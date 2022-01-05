class CreateTagging < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      t.references :excursion, foreign_key: true
    end
  end
end
