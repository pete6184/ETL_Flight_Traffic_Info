# Group Dirty Frogs ETL Project Proposal

## Title: Exploring the Relationship Between Flight Traffic Information and Air Quality

### Team Members:
- Pete Johnson
- Rylee Ahnen
- Sandy Goodell
- Chris Pulliam

## Objectives:
- Combine datasets on flight traffic information and air quality
- Explore the relationship between flight frequency and local air pollution levels
- Track this trend over time
- Did COVID reduce air traffic – and potentially improve air quality?
- Focus analysis on US, not global data

## Potential Datasets:
- Openflights.org
- Airnow.gov API
- National Oceanic and Atmospheric Administration Air Quality Data
- Github Airport Codes Dataset

<hr ---/>


# ETL Project Report

## Final Project Objectives:

Combining data sets that provides combines origin flight data with airport latitude and longitude data points and country information data points, and destination airport code. This cleaned and integrated data can be used to provide analysis with air quality data. Additionally, this data can produce flight maps by country.

#### Sources of data were extracted from:

- Openflights.org
- https://ourairports.com/data/

#### Data Transformation Objectives:

- Determining primary keys from the origin flight route data sets to the airport data sets
- Determining primary keys from the airport data sets to the country data set
- Types of transformation using jupyter notebook included:
    - cleaning
    - joining
    - filtering
    - aggregating

#### Final Collection:

Data schema will be created using the GenMyModel. The table data will upload using SQLAlchemy.

The PostgreSQL relational database will link the data using IATA code for airports and 2 character ISO code for country.  Final collection will be include the airport name, latitude, longitude and country and destination airport code. See database schema for details.

### Transformation of the data:
#### [Airline route data](https://github.com/pete6184/ETL_Project/blob/main/Data/routes.csv)

- Several columns were removed and renamed. We also removed airports that no longer existed or were designated as closed.

- Many rows were empty for various columns; we had to do some manipulations for those to use them in our SQL database tables.

#### [Airport Data](https://github.com/pete6184/ETL_Project/blob/main/Data/airports.csv)


- We removed duplicate country codes and unnecessary columns.


#### [Country Data](https://github.com/pete6184/ETL_Project/blob/main/Data/countries.csv)

- We had to rename the country code for Namibia from 'NA' to 'N' in order to prevent the country code from displaying as N/A.


### Type of final production database data is loaded into:

We used a relational database (PostgreSQL) to link the data by IATA code and ISO code. The was completed by using the following code:



### Final tables/collection that will be used in the database:
~~~
SELECT ar.airline, ar.source_airport, ap.ap_name, ct.name, ap.lat, ap.lng, ap.ap_type, ar.destination_airport
FROM airline_routes AS ar
JOIN airports AS ap ON
ar.source_airport = ap.iata_code
JOIN countries AS ct ON
ap.country_code=ct.code;
~~~


### Relational database schema:
#### [Schema](https://github.com/pete6184/ETL_Project/blob/main/create.sql)

#### [ERD](https://github.com/pete6184/ETL_Project/blob/main/Data/ERD_Airline_ETL.png)

![ERD](Data/ERD_Airline_ETL.png)
