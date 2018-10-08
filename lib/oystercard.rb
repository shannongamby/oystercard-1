require 'pry'

class Oystercard

  attr_reader :balance
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  def initialize
    @balance = 0
    @in_journey = false
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @in_journey = true

  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
