# Log
require 'logger'

module Log
	class << self
		attr_accessor :logger
		attr_accessor :out
	end
	self.logger = Logger.new STDERR
	self.out = Logger.new STDOUR
end
