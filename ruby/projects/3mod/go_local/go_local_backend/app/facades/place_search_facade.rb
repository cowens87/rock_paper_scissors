class PlaceSearchFacade
  class << self
    def place_search(title, location)
      PlaceSearchService.get_location("#{title}-#{location}".parameterize)
    end
  end
end
