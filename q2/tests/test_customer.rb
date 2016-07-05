#!/usr/bin/env ruby
require_relative '../customer.rb'
require 'minitest/autorun'

describe Customer do

  describe 'when given valid input' do 

    before do
      @customer = Customer.new(
        "1",
        "Foo",
        "12.345", 
        "67.891"
      )
    end

    it 'must return a customer object succesfully' do
      @customer.wont_be :nil?
    end

    it 'must have a getter for user_id' do
      @customer.user_id.wont_be :nil?
    end

    it 'must have a getter for name' do
      @customer.name.wont_be :nil?
    end

    it 'must have a getter for latitude' do
      @customer.latitude.wont_be :nil?
    end

    it 'must have a getter for longitude' do
      @customer.longitude.wont_be :nil?
    end

  end

  describe 'when given invalid input' do

    it 'will raise an error when no user_id is given' do
      -> { customer = Customer.new }.must_raise ArgumentError
    end

    it 'will raise an error when no name is given' do
      -> { customer = Customer.new("1") }.must_raise ArgumentError
    end

    it 'will raise an error when no latitude is given' do
      -> { customer = Customer.new("1", "Foo") }.must_raise ArgumentError
    end

    it 'will raise an error when no longitude is given' do
      -> { customer = Customer.new("1", "Foo", "123.456") }.must_raise ArgumentError
    end

  end

end