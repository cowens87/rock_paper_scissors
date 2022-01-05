class MembersInfo
  attr_reader :name, 
              :photo, 
              :allies, 
              :enemies, 
              :affiliations
  
  def initialize(member_info)
    @name         = member_info[:name]
    @photo        = member_info[:photoUrl]
    @allies       = member_info[:allies]
    @enemies      = member_info[:enemies]
    @affiliations = member_info[:affiliation]
  end
end