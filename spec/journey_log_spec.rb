require 'journey_log'

describe JourneyLog do
  let(:station) { double :station }

  it "should have an instance of Journey when initialized" do
    expect(subject.journey).to be_an_instance_of Journey
  end

  describe "#start" do
    it "should start a new journey with an entry station" do
      subject.start(station)
      expect(subject.journey.start_station).to eq station
    end
  end
end
