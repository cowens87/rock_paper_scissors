class CreateProfessorStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :professor_students do |t|
      t.references :professor, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
