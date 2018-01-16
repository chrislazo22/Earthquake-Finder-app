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
end
