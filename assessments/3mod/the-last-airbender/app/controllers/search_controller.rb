class SearchController < ApplicationController
  def index
    @members = MembersFacade.members_by_nation('Fire+Nation') if params[:nation] == 'fire_nation'
  end
end