require "rails_helper"

RSpec.describe Distance do
  let(:angle) { HaversineAngle.new(latitude_one: 34.052200,
                             latitude_two: 38.805500,
                             longitude_one: 118.2437,
                             longitude_two: 122.7623367) }

  describe "c varibale" do
    it "calculates the square root of haversine angle" do
      @sqrt_of_hav_angle = Math.sqrt(angle.haversine_angle)
      expect(angle.sqrt_of_hav_angle).to eq(@sqrt_of_hav_angle)
    end

    it "calculates the sqaure root of 1 minus the haversine angle" do
      @sqrt_minus_one = Math.sqrt(1 - angle.haversine_angle)
      expect(angle.sqrt_minus_one).to eq(@sqrt_minus_one)
    end

    it "calculates the c variable" do
      @sqrt_of_hav_angle = Math.sqrt(angle.haversine_angle)
      @sqrt_minus_one = Math.sqrt(1 - angle.haversine_angle)
      @angular_distance = 2 * (Math.atan2(@sqrt_of_hav_angle, @sqrt_minus_one))

      expect(angle.angular_distance).to eq(@angular_distance)
    end
  end

  describe "distance" do
    before do
      @earths_radius_in_miles = 3959
    end

    it "calculates the distance between two points" do
      @distance = @earths_radius_in_miles * angle.angular_distance
      expect(angle.distance_in_miles).to eq(@distance)
    end
  end
end
