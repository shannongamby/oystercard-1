require 'journey'
require 'oystercard'

describe Journey do

  let(:station) {double :station}

  it 'starts a journey' do
    expect(subject.start(station)).to eq(station)
  end

  it 'should finish a journey' do
    subject.finish(station)
    expect(subject.trip["End:"]).to eq(station)
  end

end
