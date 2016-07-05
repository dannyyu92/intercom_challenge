#!/usr/bin/env ruby
require_relative './customer_file_reader'
require_relative './customer_geo_finder'

# Get customers from text file
file_reader = CustomerFileReader.new("./customers.txt")
customers = file_reader.parse_customers

# Define constants
DUBLIN_OFFICE_LAT = 53.3381985
DUBLIN_OFFICE_LON = -6.2592576

# Find customers within distance (km) from
# a coordinate
finder = CustomerGeoFinder.new(
  {
    latitude: DUBLIN_OFFICE_LAT, 
    longitude: DUBLIN_OFFICE_LON, 
    distance: 100, 
    customers: customers
  }
)
nearby_customers = finder.get_nearby_customers

# Sort customers by ascending ID
sorted_customers = nearby_customers.sort_by { |c| c.user_id }

# Print customers
sorted_customers.each { |c| puts "#{c.name}; ID: #{c.user_id}" }