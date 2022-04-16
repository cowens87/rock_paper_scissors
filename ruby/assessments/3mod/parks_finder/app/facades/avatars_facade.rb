class AvatarsFacade
  def self.find_all_characters
    avatars_info = AvatarsService.call_avatardb('/api/v1/characters?perPage=1&page=1')
    # avatars_info.map { |avatar_info| avatarsInfo.new(avatar_info) }
    # require 'pry'; binding.pry
  end
end