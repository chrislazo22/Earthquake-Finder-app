require "rails_helper"

RSpec.describe Distance do
  let(:distance) { Distance.new(34.052200, 38.805500) }

  it "calculates the delta between two latitide coordinates" do
    expect(distance.change_in_latitude).to eq(4.753300)
  end
end
