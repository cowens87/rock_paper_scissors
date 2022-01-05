class StudentsController < ApplicationController
  def index
    @students = Student.all.alpha_order
  end
end 