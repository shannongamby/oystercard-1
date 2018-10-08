require 'oystercard'
require 'pry'

describe Oystercard do

  before :each do
    @oyster = Oystercard.new
  end

  it "starts with a balance of 0" do
    expect(@oyster.balance).to eq(0)
  end

  it 'can be topped up' do
    @oyster.topup(15)
    expect(@oyster.balance).to eq 15
  end

  it 'cannot store a balance above £90' do
    expect { @oyster.topup(91) }.to raise_error "Cannot topup £91: maximum balance of £#{Oystercard::MAXIMUM_BALANCE}"
  end
  #
  # it 'will deduct a fare' do
  #   @oyster.topup(10)
  #   @oyster.deduct(5)
  #   expect(@oyster.balance).to eq (5)
  # end

  it 'can touch in at the beginning of a journey' do
    @oyster.topup(10)
    expect(@oyster.touch_in).to eq(true)
  end

  it 'can touch out at the end of a journey' do
    expect(@oyster.touch_out).to eq(false)
  end

  it 'knows when the user is in transit' do
    @oyster.topup(10)
    @oyster.touch_in
    expect(@oyster).to be_in_journey
  end

  it 'does not allow user to touch in if balance is below minimum' do
    expect{ @oyster.touch_in }.to raise_error 'Insufficient funds'
  end

  it 'charges the user £1 on touching out' do
    @oyster.topup(10)
    @oyster.touch_in
    expect { @oyster.touch_out }.to change { @oyster.balance }.by(-Oystercard::MINIMUM_FARE)
  end

end
