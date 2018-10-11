require 'journey_log'

describe JourneyLog do
  let(:station) { double :station }
  let(:station_1) { double :station_1 }
  let(:station_2) { double :station_2 }

  it "should have an instance of Journey when initialized" do
    expect(subject.journey).to be_an_instance_of Journey
  end

  describe "#start" do
    it "should start a new journey with an entry station" do
      subject.start(station)
      expect(subject.journey.start_station).to eq station
    end
  end

  describe "#finish" do
    it "should add an exit station to the current journey" do
      subject.finish(station)
      expect(subject.journey.end_station).to eq station
    end
  end

  describe "#journeys" do
    it "should return a list of all the previous journeys" do
      subject.start(station_1)
      subject.finish(station_2)
      expect(subject.journeys).to eq "From #{station_1} to #{station_2}"
    end
  end
end
