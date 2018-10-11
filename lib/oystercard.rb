require 'pry'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :start_station, :trips

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @trips = []
    @journey = Journey.new
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @trips << @journey.trip
    penalty_for_no_exit if trips[-1]["Start:"] != nil && trips[-1]["End:"] == nil
    @journey.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    @balance -= @journey.fare
    @trips[-1] = (@journey.trip) unless @trips.empty?
    @trips
  end

  def penalty_for_no_exit
    @balance -= Journey::PENALTY
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
