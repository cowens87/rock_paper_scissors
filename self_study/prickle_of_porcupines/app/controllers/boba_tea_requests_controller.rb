class BobaTeaRequestsController < ApplicationController
  def create
    @request  = Request.find(params[:request_id])
    @rqst_tea = BobaTeaRequest.new(request_id: @request.id, boba_tea_id: params[:tea_id])
    @rqst_tea.save
    redirect_to request_path(@request)
  end
end 