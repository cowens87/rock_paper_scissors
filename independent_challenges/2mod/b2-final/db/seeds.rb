# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Hospitals:
@hospital1 = Hospital.create(name: "Seattle Grace")
@hospital2 = Hospital.create(name: "New York Hospital")
# Doctors:
@doctor1 = Doctor.create!(hospital_id: @hospital1.id, name: "Meredith Grey", specialty: "General Surgery", university_attended: "Harvard University")
@doctor2 = Doctor.create!(hospital_id: @hospital1.id, name: "Alex Karev", specialty: "Pediatric Surgery", university_attended: "Johns Hopkins University")
@doctor3 = Doctor.create!(hospital_id: @hospital2.id, name: "Miranda Bailey", specialty: "General Surgery", university_attended: "Stanford University")
@doctor4 = Doctor.create!(hospital_id: @hospital2.id,name: "Derek Webber", specialty: "Attending Surgeon", university_attended: "University of Pennsylvania")
@doctor5 = Doctor.create!(hospital_id: @hospital2.id,name: "Josh Turner", specialty: "Attending Surgeon", university_attended: "University of Pennsylvania")
# Surgeries:
@surgery1 = Surgery.create!(title: 'Knee Replacement', day_of_week: 'Monday', operating_room_number: 4)
@surgery2 = Surgery.create!(title: 'Spinal Fusion', day_of_week: 'Thursday', operating_room_number: 3)
# Doctor Surgeries: 
DoctorSurgery.create!(surgery_id: @surgery1.id, doctor_id: @doctor1.id)
DoctorSurgery.create!(surgery_id: @surgery1.id, doctor_id: @doctor2.id)
DoctorSurgery.create!(surgery_id: @surgery2.id, doctor_id: @doctor3.id)
DoctorSurgery.create!(surgery_id: @surgery2.id, doctor_id: @doctor4.id)