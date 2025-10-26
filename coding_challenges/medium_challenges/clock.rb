=begin
class Clock
  attr_accessor :hour, :minutes

  DAY_MINUTES = 1440

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes=0)
    new(hour, minutes)
  end

  def +(extra_mins)
    extra_mins = extra_mins % DAY_MINUTES if extra_mins > DAY_MINUTES
    total = hour * 60 + minutes + extra_mins
    Clock.new((total / 60) % 24, (total % 60))
  end

  def -(less_mins)
    less_mins = less_mins % DAY_MINUTES if less_mins > DAY_MINUTES
    total = hour * 60 + minutes - less_mins
    Clock.new((total / 60) % 24, (total % 60))
  end

  def ==(other_clock)
    hour == other_clock.hour &&
    minutes == other_clock.minutes
  end

  def to_s
    sprintf('%02d:%02d', @hour, @minutes)
  end
end
=end

class Clock
  attr_reader :hour, :minutes, :total_minutes

  def initialize(hour, minutes=0)
    @total_minutes = (hour * 60) + minutes
    @hour = (@total_minutes / 60) % 24
    @minutes = @total_minutes % 60
  end

  def +(minutes)
    Clock.new(0, total_minutes + minutes)
  end

  def -(minutes)
    Clock.new(0, total_minutes - minutes)
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def self.at(hour, minutes=0)
    Clock.new(hour, minutes)
  end

  def to_s
    format('%.2d:%.2d', hour, minutes)
  end
end

