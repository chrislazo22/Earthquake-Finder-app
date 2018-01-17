require "rails_helper"

RSpec.describe Distance do
  let(:angle) { HaversineAngle.new(latitude_one: 34.052200,
                             latitude_two: 38.805500,
                             longitude_one: 118.2437,
                             longitude_two: 122.7623367) }

  before do
    @earths_radius_in_miles = 3959
  end

  it "calculates the distance between two points" do
    @distance = @earths_radius_in_miles * angle.angular_distance
    expect(angle.distance_in_miles).to eq(@distance)
  end
end
