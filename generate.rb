#!/usr/bin/env ruby
# encoding: UTF-8

#usage: ./generator.rb zh-CN
require_relative 'Commands.rb'
Commands.generate_delta(ARGV, false)
