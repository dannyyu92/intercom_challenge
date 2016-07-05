#!/usr/bin/env ruby
require_relative './great_circle_distance_calculator'

class CustomerGeoFinder

  attr_reader :latitude
  attr_reader :longitude
  attr_reader :distance
  attr_reader :customers

  def initialize(args={})
    @latitude = args[:latitude] || nil
    @longitude = args[:longitude] || nil
    @distance = args[:distance] || nil
    @customers = args[:customers] || []
  end

  def get_nearby_customers
    nearby_customers = []
    self.customers.each do |customer|
      if customer_is_within_distance?(customer)
        nearby_customers << customer
      end
    end
    return nearby_customers
  end

  private

  def customer_is_within_distance?(customer)
    distance_calculator = GreatCircleDistanceCalculator.new(
      customer.latitude, 
      customer.longitude,
      self.latitude, 
      self.longitude
    )
    distance = distance_calculator.calculate
    return distance <= self.distance
  end

end