class AngularDistance
  EARTHS_RADIUS_IN_MILES = 3959

  def sqrt_of_hav_angle
    Math.sqrt(haversine_angle)
  end

  def sqrt_minus_one
    Math.sqrt(1 - haversine_angle)
  end

  def angular_distance
    2 * (Math.atan2(sqrt_of_hav_angle, sqrt_minus_one))
  end

  def distance_in_miles
    EARTHS_RADIUS_IN_MILES * angular_distance
  end
end
