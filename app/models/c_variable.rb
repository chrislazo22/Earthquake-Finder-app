class CVariable

  def sqrt_of_hav_angle
    Math.sqrt(haversine_angle)
  end

  def sqrt_minus_one
    Math.sqrt(1 - haversine_angle)
  end

  def c_variable
    2 * (Math.atan2(sqrt_of_hav_angle, sqrt_minus_one))
  end
end
