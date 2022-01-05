class RequestsController < ApplicationController
  def new; end

  def create
    request = Request.create!(request_params)
    if request.save
      redirect_to request_path(request.id)
    else
      flash.now[:notice]= "Please Complete All Fields"
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])   
    if params[:tea_name]
      @boba_teas = BobaTea.find_by_name(params[:tea_name])
    end 
  end

  def update
    request = Request.find(params[:id])
    request.update({status: 1})
    redirect_to request_path(request)
  end

  private 

  def request_params
    params.permit(:name, :address, :city, :state, :zip, :reason)
  end
end