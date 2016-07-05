#!/usr/bin/env ruby
require_relative './file_reader'
require_relative './customer_finder'
require 'byebug'

file_reader = FileReader.new("./customers.txt")
customers = file_reader.parse_file


DUBLIN_OFFICE_LAT = 53.3381985
DUBLIN_OFFICE_LON = -6.2592576

finder = CustomerFinder.new(
  {
    latitude: DUBLIN_OFFICE_LAT, 
    longitude: DUBLIN_OFFICE_LON, 
    distance: 100, 
    customers: customers
  }
)
