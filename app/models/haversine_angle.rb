class HaversineAngle < CVariable
  attr_accessor :latitude_one, :latitude_two, :longitude_one, :longitude_two

  def initialize(args={})
    @latitude_one = args[:latitude_one]
    @latitude_two = args[:latitude_two]
    @longitude_one = args[:longitude_one]
    @longitude_two = args[:longitude_two]
  end

  def change_in_latitude
    (latitude_two - latitude_one)
  end

  def change_in_longitude
    (longitude_two - longitude_one)
  end

  def latitude_in_radians
    (change_in_latitude * convert_to_radians)
  end

  def longitude_in_radians
    (change_in_longitude * convert_to_radians)
  end

  def sin_of_latitude
    ((Math.sin(latitude_in_radians / 2) ** 2))
  end

  def cosine_of_latitude_one
    (Math.cos(latitude_one * convert_to_radians))
  end

  def cosine_of_latitude_two
    (Math.cos(latitude_two * convert_to_radians))
  end

  def sin_of_longitude
    ((Math.sin(longitude_in_radians / 2) ** 2))
  end

  def haversine_angle
    sin_of_latitude + (cosine_of_latitude_one * cosine_of_latitude_two * sin_of_longitude)
  end

  def convert_to_radians
    (Math::PI / 180)
  end
end
