require 'date'

class Meetup
  def initialize(year, month)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    dowm_range(schedule).each do |i|
      return nil unless Date.valid_date?(@year, @month, i)
      meetup = Date.new(@year, @month, i)
      return meetup if valid_weekday?(weekday, meetup)
    end
    nil
  end

  def dowm_range(schedule)
    case schedule.downcase
    when 'first'then (1..7)
    when 'second'then (8..14)
    when 'third'then (15..21)
    when 'fourth'then (22..28)
    when 'fifth'then (29..31)
    when 'last'then (-7..-1)
    when 'teenth'then (13..19)
    end
  end

  def valid_weekday?(weekday, meetup)
    case weekday.downcase
    when 'monday' then meetup.monday?
    when 'tuesday' then meetup.tuesday?
    when 'wednesday' then meetup.wednesday?
    when 'thursday'then meetup.thursday?
    when 'friday'then meetup.friday?
    when 'saturday'then meetup.saturday?
    when 'sunday'then meetup.sunday?
    end
  end
end