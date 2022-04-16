class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all.alpha_order    
  end

  def show
    @professor = Professor.find(params[:id])
  end
end 