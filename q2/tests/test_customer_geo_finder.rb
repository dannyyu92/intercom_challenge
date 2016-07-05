#!/usr/bin/env ruby
require_relative '../customer_geo_finder'
require 'minitest/autorun'

describe CustomerGeoFinder do

  describe 'when given valid arguments' do 

    before do
      reader = CustomerFileReader.new(
        "./tests/customers.txt"
      )
      customers = reader.parse_customers

      @finder = CustomerGeoFinder.new(
        {
          latitude: "53.3381985", 
          longitude: "-6.2592576", 
          distance: 100, 
          customers: customers
        }
      )
    end

    it 'must return back nearby customers' do
      nearby_customers = @finder.get_nearby_customers
      nearby_customers.wont_be :nil?
    end

    it 'must return back the correct number of customers within "\
     "that distance from the lat lon' do
      nearby_customers = @finder.get_nearby_customers
      nearby_customers.count.must_equal 16
    end
  end

end