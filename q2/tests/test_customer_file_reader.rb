#!/usr/bin/env ruby
require_relative '../customer_file_reader.rb'
require 'minitest/autorun'

describe CustomerFileReader do

  describe 'when given a valid customer file' do 

    before do
      @reader = CustomerFileReader.new(
        "./tests/customers.txt"
      )
    end

    it 'must return a customer objects back succesfully' do
      customers = @reader.parse_customers
      customers.count.must_be :>, 0
    end
  end

  describe 'when given a faulty customer file' do

    it 'will print an error if there is an error creating a customer' do
      assert_output(/Error creating customer/) do 
        reader = CustomerFileReader.new(
          "./tests/faulty_customers.txt"
        )
        customers = reader.parse_customers
      end
    end

  end

end