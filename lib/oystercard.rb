require 'pry'

class Oystercard

  attr_reader :balance, :start_station, :trips

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @trips = []
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @start_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @trips << {"Start:" => @start_station, "End:" => station }
    @start_station = nil
  end

  def in_journey?
    true if @start_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
