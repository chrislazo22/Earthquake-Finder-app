class EarthquakeLocation < ApplicationRecord
  require 'csv'
  require 'open-uri'

  # url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv"
  # url_data = open(url)
  require 'csv'
  csv_text = File.open("all_month.csv")

  def import
    CSV.foreach(csv_text, :headers => true) do |row|
      time = row["time"]
      latitude = row["latitude"].to_f
      longitude = row["longitude"].to_f.abs
      mag = row["mag"].to_f

      distance = HaversineAngle.new(latitude_two: latitude,
                                    longitude_two: longitude).distance_in_miles

      magnitude_distance = mag * 100

      puts "Mag Dis = #{magnitude_distance}"
      puts "Distance = #{distance}"
      puts "Time = #{time}"
    end
  end
end
