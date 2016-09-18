# encoding: UTF-8
# Log
require 'logger'

module Log
	class << self
		attr_accessor :logger
	end
	self.logger = Logger.new STDERR
end
