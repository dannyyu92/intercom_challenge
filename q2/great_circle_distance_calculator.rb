#!/usr/bin/env ruby

class GreatCircleDistanceCalculator

  attr_reader :lat1
  attr_reader :lon1
  attr_reader :lat2
  attr_reader :lon2

  RADIUS_OF_EARTH_IN_KM = 6371

  def initialize(lat1, lon1, lat2, lon2)
    @lat1 = lat1
    @lon1 = lon1
    @lat2 = lat2
    @lon2 = lon2
    validate_coordinates!
  end

  def calculate
    lat1_radians = degrees_to_radians(self.lat1)
    lon1_radians = degrees_to_radians(self.lon1)
    lat2_radians = degrees_to_radians(self.lat2)
    lon2_radians = degrees_to_radians(self.lon2)
    central_angle = central_angle(lat1_radians, lon1_radians, lat2_radians, lon2_radians)
    RADIUS_OF_EARTH_IN_KM * central_angle
  end

  private

  def central_angle(lat1, lon1, lat2, lon2)
    delta_lon = (lon1 - lon2).abs
    Math.acos((Math.sin(lat1) * Math.sin(lat2)) + (Math.cos(lat1) * Math.cos(lat2) * Math.cos(delta_lon)))
  end

  def degrees_to_radians(degrees)
    (degrees.to_f * Math::PI) / 180 
  end

  def validate_coordinates!
    if coordinate_is_valid?(self.lat1) &&
      coordinate_is_valid?(self.lat2) && 
      coordinate_is_valid?(self.lon1) && 
      coordinate_is_valid?(self.lon2)
    else
      raise "coordinates are invalid"
    end
  end

  def coordinate_is_valid?(coordinate)
    coordinate.to_s =~ /(\-?\d+(\.\d+)?)/
  end

end