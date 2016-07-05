#!/usr/bin/env ruby
require_relative '../great_circle_distance_calculator'
require 'minitest/autorun'

describe GreatCircleDistanceCalculator do

  describe 'when given valid arguments' do 

    before do
      @calculator = GreatCircleDistanceCalculator.new(
        "52.986375", 
        "-6.043701", 
        "53.3381985", 
        "-6.2592576"
      )
    end

    it 'must return the spherical distance between coordinates correctly' do
      distance = @calculator.calculate
      distance.must_equal 41.676839095769566
    end
  end

  describe 'when given invalid arguments' do

    it 'will raise an error if a coordinate is not valid' do
      err = assert_raises(RuntimeError) do
        calculator = GreatCircleDistanceCalculator.new(
          "foo", 
          "-6.043701", 
          "53.3381985", 
          "-6.2592576"
        )
        calculator.calculate
      end
      assert_match /coordinates are invalid/, err.message
    end

  end

end