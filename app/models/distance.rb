class Distance
  attr_accessor :latitude_one, :latitude_two, :longitude_one, :longitude_two

  def initialize(args={})
    @latitude_one = args[:latitude_one]
    @latitude_two = args[:latitude_two]
    @longitude_one = args[:longitude_one]
    @longitude_two = args[:longitude_two]
  end

  def change_in_latitude
    (latitude_two - latitude_one).round(7)
  end

  def change_in_longitude
    (longitude_two - longitude_one).round(7)
  end

  def latitude_in_radians
    (change_in_latitude * convert_to_radians).round(9)
  end

  def longitude_in_radians
    (change_in_longitude * convert_to_radians).round(9)
  end

  def cosine_of_latitude_one
    (Math.cos(latitude_one * convert_to_radians))
  end

  def convert_to_radians
    (Math::PI / 180)
  end
end
