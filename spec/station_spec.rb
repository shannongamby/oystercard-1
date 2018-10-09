require 'station'

describe Station do
  it "should tell user its zone" do
    station = Station.new("station", 2)
    expect(station.zone).to eq(2)
  end
end
