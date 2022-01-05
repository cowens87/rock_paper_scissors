class Admin::RequestsController < ApplicationController
  def show
    @request = Request.find(params[:id])
  end
end