class CreateBobaTeaRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :boba_tea_requests do |t|
      t.references :boba_tea, foreign_key: true
      t.references :request, foreign_key: true
    end
  end
end
