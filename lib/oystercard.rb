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
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @current_journey = Journey.new
    @balance -= @current_journey.fare
    @current_journey.start(station)
    #@balance -= 6
  end

  def touch_out(station)
    #@balance += 6
    @current_journey.finish(station)
    @balance -= @current_journey.fare
    @trips << @current_journey.trip
  end

  # def in_journey?
  #   !@current_journey.complete?
  # end

  private

  def deduct(amount)
    @balance -= amount
  end

end
