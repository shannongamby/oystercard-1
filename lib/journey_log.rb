class JourneyLog
  attr_reader :journey

  def initialize(journey_class = Journey.new)
    @journey = journey_class
    @journey_history = []
  end

  def start(station)
    current_journey.start(station)
  end

  def finish(station)
    current_journey.finish(station)
    @journey_history << @journey
  end

  def journeys
    return "empty" if @journey_history.empty?
    @journey_history.map do |journey|
      "From #{journey.start_station} to #{journey.end_station}"
    end.join('\n')
  end

  def last_journey_complete?
    return true if @journey_history.last == nil
    @journey_history.last.complete?
  end

  private

  def current_journey
    return @journey if !@journey.complete?
    @journey = Journey.new
  end
end
