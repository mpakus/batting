#!/usr/bin/env ruby

require 'optparse'
require_relative '../lib/batting'
require_relative '../lib/table'

options = {}

parser = OptionParser.new do |parser|
  parser.on("-y", "--year YEAR", "Filter by Year") { |year| options[:year] = year }
  parser.on("-t", "--team NAME", "Filter by the Team name") { |team| options[:team] = team }
end
parser.parse!

Table.new(
  Batting.performance(options)
).print
