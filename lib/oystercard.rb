require 'pry'

class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def topup(amount)
    raise "Cannot topup #{amount}: maximum balance of £90" if (90 - @balance) < amount
    @balance += amount
  end

end
