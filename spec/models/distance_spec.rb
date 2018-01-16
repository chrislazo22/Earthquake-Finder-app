require "rails_helper"

RSpec.describe Distance do
  describe "Coordinates" do
    let(:latitude) { Distance.new(latitude_one: 34.052200,
                                  latitude_two: 38.805500) }
    let(:longitude) { Distance.new(longitude_one: 118.2437,
                                   longitude_two: -122.7623367) }

    it "calculates the delta between two latitude coordinates" do
      expect(latitude.change_in_latitude).to eq(4.753300)
    end

    it "calculates the delta between two longitude coordinates" do
      expect(longitude.change_in_longitude).to eq(-241.0060367)
    end

    it "converts latitude degrees to radians" do
      expect(latitude.latitude_in_radians).to eq(0.082960735)
    end

    it "converts longitude degrees to radians" do
      expect(longitude.longitude_in_radians).to eq(-4.206348858)
    end
  end
end
