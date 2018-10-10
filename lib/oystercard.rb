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
    @balance -= Journey::PENALTY if @journey.trip["End:"] == nil
    @journey.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    @balance -= Journey::PENALTY if @journey.trip["Start:"] == nil
    @trips << @journey.trip
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
