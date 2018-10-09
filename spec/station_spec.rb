require 'station'

describe Station do

  context 'initialization' do

    station = Station.new("station", 2)

    it "should tell user its zone" do
      expect(station.zone).to eq(2)
    end

    it "should tell the user its name" do
      expect(station.name).to eq("station")
    end

  end

end
