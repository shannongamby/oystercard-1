class JourneyLog
  attr_reader :journey

  def initialize(journey_class = Journey.new)
    @journey = journey_class
  end

  def start(station)
    @journey = Journey.new
    @journey.start(station)
  end
end
