require 'rails_helper'

RSpec.describe Surgery, type: :model do
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
  
    describe 'relationships' do
    it {should have_many :doctor_surgeries}
    it {should have_many(:doctors).through(:doctor_surgeries)}
  end

  describe 'All surgeries that happen on the same day of the week as this surgery' do
    it 'Can find title of all surgeries happening on the same day' do
      expect(Surgery.find_others_by_day(@surgery2).pluck(:title)).to eq(["Knee Replacement"])
    end
  end
end