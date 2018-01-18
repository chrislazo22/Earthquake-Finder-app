class CreateEarthquakeLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :earthquake_locations do |t|
      t.string :time
      t.float :latitude
      t.float :longitude
      t.float :mag

      t.timestamps
    end
  end
end
