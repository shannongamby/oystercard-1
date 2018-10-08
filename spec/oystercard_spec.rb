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
    expect { @oyster.topup(91) }.to raise_error "Exceeded maximum balance of £90"
  end

end
