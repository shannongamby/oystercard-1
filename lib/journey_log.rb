class JourneyLog
  attr_reader :journey

  def initialize(journey_class = Journey.new)
    @journey = journey_class
    @journey_history = []
  end

  def start(station)
    @journey = Journey.new
    @journey.start(station)
  end

  def finish(station)
    @journey.finish(station)
    @journey_history << @journey
  end

  def journeys
    @journey_history.map do |journey|
      "From #{journey.start_station} to #{journey.end_station}"
    end.join('\n')
  end

end
