class EarthquakeLocation < ApplicationRecord
  require "csv"
  require "open-uri"
  attr_accessor :user_start_date, :user_end_date, :earthquake_date, :latitude,
                :longitude, :magnitude

  def earthquake_data(args={})
    @user_start_date  = Date.parse(args[:user_start_date])
    @user_end_date    = Date.parse(args[:user_end_date])
    @earthquake_date  = Date.parse(args[:earthquake_date])
    @latitude         = args[:latitude].to_f
    @longitude        = args[:longitude].to_f.abs
    @magnitude        = args[:mag].to_f
  end

  def csv_parser(start_date, end_date)
    EarthquakeLocation.delete_all

    CSV.foreach(url_information, :headers => true) do |row|
      earthquake_data(user_start_date: start_date,
                      user_end_date: end_date,
                      earthquake_date: row["time"],
                      latitude: row["latitude"],
                      longitude: row["longitude"].to_f.abs,
                      mag: row["mag"].to_f)

      if between_user_dates?(user_start_date, user_end_date) &&
         earthquake_distance(magnitude) > distance_from_los_angeles(latitude, longitude)
        EarthquakeLocation.create!(:time => row["time"],
                                  :latitude => row["latitude"],
                                  :longitude => row["longitude"],
                                  :mag => row["mag"])
        break if EarthquakeLocation.count >= 10
      end
    end
  end

  def between_user_dates?(user_start_date, user_end_date)
    earthquake_date.between?(user_start_date, user_end_date)
  end

  def distance_from_los_angeles(latitude, longitude)
    HaversineAngle.new(latitude_two: latitude,
                       longitude_two: longitude).distance_in_miles
  end

  def earthquake_distance(magnitude)
    magnitude * 100
  end

  private

  def url_information
    url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv"
    url_data = open(url)
  end
end
