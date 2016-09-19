#!/usr/bin/env ruby

#usage: ./generator.rb zh-CN
require_relative 'Commands.rb'
Commands.generate_delta(ARGV, false)
