require 'pry'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :start_station, :trips

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @trips = JourneyLog.new
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def touch_in(station = nil)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    penalty_for_no_exit if !@trips.last_journey_complete?
    @trips.start(station)

  end

  def touch_out(station = nil)
    @trips.finish(station)
    @balance -= @trips.journey.fare
  end

  def penalty_for_no_exit
    @balance -= Journey::PENALTY
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
