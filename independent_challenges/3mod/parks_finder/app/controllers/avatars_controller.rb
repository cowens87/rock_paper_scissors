class AvatarsController < ApplicationController
  def index
    @avatars = AvatarsFacade.find_all_characters
  end
end