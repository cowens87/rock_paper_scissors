class DoctorSurgeriesController < ApplicationController
  def create
    # require 'pry'; binding.pry
    doctor = Doctor.by_name(params[:doctor])
    DoctorSurgery.create!(surgery_id: params[:surgery_id], doctor_id: doctor.id)
    redirect_to surgery_path(params[:surgery_id])
  end
end