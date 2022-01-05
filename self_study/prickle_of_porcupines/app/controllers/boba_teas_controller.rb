class BobaTeasController < ApplicationController
  def index
    if params[:tea_threshold]
      @boba_teas = BobaTea.teas_by_price(params[:tea_threshold])
    else 
      @boba_teas = BobaTea.true_false
    end 
  end

  def show
    @boba_tea = BobaTea.find(params[:id])
  end

  def edit
    @boba_tea = BobaTea.find(params[:id])
  end

  def update
    boba_tea = BobaTea.find(params[:id])
    boba_tea.update(boba_params)
    redirect_to boba_tea_path(boba_tea)
  end

  def destroy
    BobaTea.destroy(params[:id])
    redirect_to boba_teas_path
  end

  private

  def boba_params
     params.require(:boba_tea).permit(:name, :price, :base, :caffeinated, :description)
  end
end