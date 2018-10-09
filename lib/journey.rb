class Journey

  def start(station)
    @start_station = station
  end

  def finish(station)
    @end_station = station
  end

  def trip
    {"Start:" => @start_station, "End:" => @end_station}
  end

end
