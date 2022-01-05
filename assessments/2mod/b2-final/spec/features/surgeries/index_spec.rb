require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a surgerys index page' do
    before(:each) do
      # Hospitals:
      @hospital1 = Hospital.create(name: "Seattle Grace")
      @hospital2 = Hospital.create(name: "New York Hospital")
      # Doctors:
      @doctor1 = Doctor.create!(hospital_id: @hospital1.id, name: "Meredith Grey", specialty: "General Surgery", university_attended: "Harvard University")
      @doctor2 = Doctor.create!(hospital_id: @hospital1.id, name: "Alex Karev", specialty: "Pediatric Surgery", university_attended: "Johns Hopkins University")
      @doctor3 = Doctor.create!(hospital_id: @hospital2.id, name: "Miranda Bailey", specialty: "General Surgery", university_attended: "Stanford University")
      @doctor4 = Doctor.create!(hospital_id: @hospital2.id,name: "Derek Webber", specialty: "Attending Surgeon", university_attended: "University of Pennsylvania")
      # Surgeries:
      @surgery1 = Surgery.create!(title: 'Knee Replacement', day_of_week: 'Thursday', operating_room_number: 4)
      @surgery2 = Surgery.create!(title: 'Spinal Fusion', day_of_week: 'Thursday', operating_room_number: 3)
      # Doctor Surgeries: 
      DoctorSurgery.create!(surgery_id: @surgery1.id, doctor_id: @doctor1.id)
      DoctorSurgery.create!(surgery_id: @surgery1.id, doctor_id: @doctor2.id)
      DoctorSurgery.create!(surgery_id: @surgery2.id, doctor_id: @doctor3.id)
      DoctorSurgery.create!(surgery_id: @surgery2.id, doctor_id: @doctor4.id)
    end
    # User Story 1
    describe 'Surgery Index' do
      it 'I see the title of all surgeries and the names of all doctors performing that surgery' do
        visit surgeries_path

        within("#surgery-info-#{@surgery1.id}") do
          expect(page).to have_content(@surgery1.title)
          expect(page).to have_content(@doctor1.name)
          expect(page).to have_content(@doctor2.name)
        end 

        within("#surgery-info-#{@surgery2.id}") do
          expect(page).to have_content(@surgery2.title)
          expect(page).to have_content(@doctor3.name)
          expect(page).to have_content(@doctor4.name)
        end 
      end
    end
  end
end