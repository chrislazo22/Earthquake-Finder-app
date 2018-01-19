class EarthquakeLocation < ApplicationRecord
  require "csv"
  require "open-uri"

  def csv_parser(start_date, end_date)
    url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv"
    url_data = open(url)
    date_range = end_date..start_date
    EarthquakeLocation.delete_all

    CSV.foreach(url_data, :headers => true) do |row|
      user_start_date = Date.parse(start_date)
      user_end_date = Date.parse(end_date)
      earthquake_date = Date.parse(row["time"])

      latitude = row["latitude"].to_f
      longitude = row["longitude"].to_f.abs
      mag = row["mag"].to_f

      if earthquake_date.between?(user_start_date, user_end_date) && earthquake_distance(mag) > distance_from_los_angeles(latitude, longitude)
        EarthquakeLocation.create!(:time => row["time"],
                                  :latitude => row["latitude"],
                                  :longitude => row["longitude"],
                                  :mag => row["mag"])
        break if EarthquakeLocation.count >= 10
      end
    end
  end

  def distance_from_los_angeles(latitude, longitude)
    HaversineAngle.new(latitude_two: latitude,
                       longitude_two: longitude).distance_in_miles
  end

  def earthquake_distance(mag)
    mag * 100
  end
end
