require "rails_helper"

RSpec.describe CVariable do
  let(:angle) { HaversineAngle.new(latitude_one: 34.052200,
                             latitude_two: 38.805500,
                             longitude_one: 118.2437,
                             longitude_two: -122.7623367) }
  let(:c_variable) { CVariable.new }

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
      @c_variable = 2 * (Math.atan2(@sqrt_of_hav_angle, @sqrt_minus_one))

      expect(angle.c_variable).to eq(@c_variable)
    end
  end
end
