#!/usr/bin/env ruby
require 'json'

class FileReader

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse_file
    array = []
    File.open(self.filename, "r") do |f|
      f.each_line do |line|
        json_hash = JSON.parse(line)
        array << json_hash
      end
    end
    return array
  end

end