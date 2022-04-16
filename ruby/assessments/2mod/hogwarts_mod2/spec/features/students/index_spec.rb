require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit students Index page' do
    before(:each) do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
      ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
      ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
      ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
    end
    # User Story 3
    it 'I see a list of students and the number of professors each student has' do
      visit "/students"
      
      expect(page).to have_content("#{@harry.name} : 3")
      expect(page).to have_content("#{@malfoy.name} : 2")
      expect(page).to have_content("#{@longbottom.name} : 1")
    end
    # Extension 
    it 'On all index pages, all information is listed alphabetically'  do
      visit "/students"

      expect(@malfoy.name).to appear_before(@harry.name)
      expect(@malfoy.name).to appear_before(@longbottom.name)    
      expect(@harry.name).to_not appear_before(@malfoy.name)    
      expect(@longbottom.name).to_not appear_before(@harry.name)   
    end
  end
end
