require 'oystercard'

describe Oystercard do
  it "starts with a balance of 0" do
    oyster = Oystercard.new
    expect(oyster.balance).to eq(0)
  end
end
