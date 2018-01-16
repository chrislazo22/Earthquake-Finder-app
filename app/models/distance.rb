class Distance
  attr_accessor :latitude_one, :latitude_two

  def initialize(latitude_one, latitude_two)
    @latitude_one = latitude_one
    @latitude_two = latitude_two
  end

  def change_in_latitude
    (latitude_two - latitude_one).round(6)
  end
end
