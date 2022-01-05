class MembersFacade
  def self.members_by_nation(nation)
    members_info = MembersService.call_avatardb("/api/v1/characters?affiliation=#{nation}&perPage=150&page=1")
    members_info.map { |member_info| MembersInfo.new(member_info) }
  end
end