# Log
require 'logger'

module Log
	class << self
		attr_accessor :logger
	end
	self.logger = Logger.new STDOUT
end
