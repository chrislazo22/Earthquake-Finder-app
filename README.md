# Earthquake Locator

The Earthquake Locator application is designed to find the first 10 earthquakes, within a specified date range, that can be felt at 34.0522° N and 118.2437° W in Los Angeles.

## Getting Started
1. Clone or download this repository and enter the folder
2. Run `bin/rails s` and open localhost:3000 on a web browser

## Design Approach

Upon its initial creation, I focused on what models were necessary to complete the application. I began with the formulas that find the distance between two coordinate points; that is, the Haversine Angle, Angular distance and Distance formulas.

Beginning with the Haversine Angle formula, I split the formula, and the variables within it, into different methods. I chose this design approach for two reasons:

1. To test individual variables of the equation; and
2. To allow for scalability and expansion if necessary.

Furthermore, I designed the Distance class to inherit from the Haversine Angle class. In the Distance class, two significant methods were created: angular_distance and distance_in_miles.

The EarthquakeLocation model handles the bulk of the logic in this application. Here, the csv_parser method will open, read and manipulate the data to achieve the desired results.

For the front-end of the application, I used the MaterializeCSS framework. There are two pages in this application: the home page (root_path) and the index page. At the home page, a user can select two dates. Once the dates are submitted, the user will be directed to the index page, where a google map will show markers of the earthquakes that meet the respective requirements. Lastly, a user can access more information on the earthquakes by clicking their markers.

## Thanks
I would like to thank those at Fullscreen Media who have taken the time to review this application.

## Author
Christian Lazo / [LinkedIn](https://www.linkedin.com/in/christian-lazo)
