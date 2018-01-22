# Earthquake Locator

This application is a coding challenge created for Fullscreen Media.

The Earthquake Locator application is designed to find the first 10 earthquakes that can be felt at a given location in Los Angeles at 34.0522° N and 118.2437° W for a specified date range.

## Getting Started
1. Clone or download this repository and enter the folder
2. Run `bin/rails s`
3. Select dates

## Design Approach

Upon the initial creation of the application, I focused on what models were necessary to complete this application. I began with the formulas that find the distance between to coordinate points, that is, the Haversine Angle, Angular distance and Distance formulas.

Beginning with the Haversine Angle formula, I decided to split the formula into different methods. I chose this design approach for two reasons:

1. To test individual variables of the equation.
2. Allow for scalability and expansion if necessary

Using inheritance, I designed the Distance class to be the parent class of the Haversine Angle class. In the Distance class, two significant methods were created: angular_distance and distance_in_miles.

The EarthquakeLocation model handles the bulk of the logic in this application. Here the csv_parser method will open, read and manipulate the data to achieve the desired results.

For the front-end of the application, I used the MaterializeCSS framework. There are two pages in this application, the home page (root_path) and an index page. At the home page, a user can select two dates. Once the dates are submitted, the user will be directed to the index page where a google map will show markers of the earthquakes that meet the requirements. Lastly, clicking a marker will show the information of that earthquake.

## Thanks
I would like to thank those at Fullscreen who have taken the time to review this application.

## Author
Christian Lazo / [LinkedIn](https://www.linkedin.com/in/christian-lazo)
