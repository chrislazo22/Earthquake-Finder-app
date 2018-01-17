class Distance

  def distance_in_miles
    earths_radius_in_miles * angular_distance
  end

  private

  def earths_radius_in_miles
    3959
  end
end
