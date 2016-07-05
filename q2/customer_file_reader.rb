#!/usr/bin/env ruby
require_relative './customer'
require 'json'

class CustomerFileReader

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse_customers
    customers = []
    File.open(self.filename, "r") do |f|
      f.each_line do |line|
        begin
          json_hash = JSON.parse(line)
          customer = create_customer_from_hash(json_hash)
          customers << customer
        rescue => e
          puts "Error creating customer"
        end
      end
    end
    return customers
  end

  private

  def create_customer_from_hash(hash)
    Customer.new(
      hash["user_id"], 
      hash["name"], 
      hash["latitude"], 
      hash["longitude"]
    )
  end

end