#!/usr/bin/env ruby

class Customer

  attr_reader :user_id
  attr_reader :name
  attr_reader :latitude
  attr_reader :longitude

  def initialize(user_id, name, latitude, longitude)
    @user_id = user_id
    @name = name
    @latitude = latitude
    @longitude = longitude
  end
  
end