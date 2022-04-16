class HolidaysFacade
  def self.upcoming_holidays
    holidays = NagerService.call_db("/api/v2/NextPublicHolidays/US")
    require 'pry'; binding.pry
  end
   
end