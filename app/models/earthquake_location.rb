class EarthquakeLocation < ApplicationRecord
  require "csv"
  require "open-uri"
  attr_accessor :address, :user_start_date, :user_end_date, :earthquake_date, :earthquake_latitude,
                :earthquake_longitude, :magnitude

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def earthquake_data(args={})
    @user_start_date      = Date.parse(args[:user_start_date])
    @user_end_date        = Date.parse(args[:user_end_date])
    @earthquake_date      = Date.parse(args[:earthquake_date])
    @earthquake_latitude  = args[:earthquake_latitude].to_f
    @earthquake_longitude = args[:earthquake_longitude].to_f.abs
    @magnitude            = args[:mag].to_f
  end

  def csv_parser(start_date, end_date)
    EarthquakeLocation.delete_all

    CSV.foreach(url_information, headers: true) do |row|
      earthquake_data(user_start_date: start_date,
                      user_end_date: end_date,
                      earthquake_date: row["time"],
                      earthquake_latitude: row["latitude"],
                      earthquake_longitude: row["longitude"].to_f.abs,
                      mag: row["mag"].to_f)

      if between_user_dates?(user_start_date, user_end_date) &&
        earthquake_distance(magnitude) > distance_from_los_angeles(earthquake_latitude, earthquake_longitude)

        EarthquakeLocation.create!(time: row["time"],
                                   latitude: row["latitude"],
                                   longitude: row["longitude"],
                                   mag: row["mag"])

        break if EarthquakeLocation.count >= 10
      end
    end
  end

  def between_user_dates?(user_start_date, user_end_date)
    earthquake_date.between?(user_start_date, user_end_date)
  end

  def distance_from_los_angeles(earthquake_latitude, earthquake_longitude)
    HaversineAngle.new(latitude_two: earthquake_latitude,
                       longitude_two: earthquake_longitude).distance_in_miles
  end

  def earthquake_distance(magnitude)
    magnitude * 100
  end

  def city_and_state(earthquake_latitude, earthquake_longitude)
    geo_localization = "#{earthquake_latitude},#{earthquake_longitude}"
    address = Geocoder.search(geo_localization).first
    result = "#{address.city}, #{address.state}"
  end

  private

  def url_information
    url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv"
    url_data = open(url)
  end
end
