require 'journey'
require 'oystercard'
require 'pry'

describe Journey do

  let(:station) {double :station}

  it 'starts a journey' do
    expect(subject.start(station)).to eq(station)
  end

  it 'should finish a journey' do
    subject.finish(station)
    expect(subject.trip["End:"]).to eq(station)
  end

  it 'should know if a journey is complete' do
    subject.start(station)
    subject.finish(station)
    expect(subject.complete?).to eq true
  end

  it "should have a minimum fare" do
    subject.start(station)
    subject.finish(station)
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

  it "should charge penalty fare if there is no entry station" do
    subject.start
    expect(subject.fare).to eq Journey::PENALTY
  end

end
