class Journey

  MINIMUM_FARE = 1
  PENALTY = 6

  def initialize
    @complete = false
  end

  def start(station = nil)
    @start_station = station
  end

  def finish(station)
    @end_station = station
    @complete = true
  end

  def trip
    {"Start:" => @start_station, "End:" => @end_station}
  end

  def complete?
    @complete
  end

  def fare
    @complete ? MINIMUM_FARE : PENALTY
  end

end
