require 'rails_helper'

RSpec.describe EarthquakeLocation, type: :model do
  let (:quake_location) { EarthquakeLocation.new }

  describe "Initialization" do
    it "is valid with the correct attributes" do
      expect(quake_location).to be_truthy
    end
  end
end
