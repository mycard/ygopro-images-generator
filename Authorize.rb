# encoding: UTF-8
# Check the command is legal or not
require 'json'
require 'digest/md5'
require File.dirname(__FILE__) + "/Log.rb"

module Authorize
	module_function
	
	@@command_password = "7c7cc75c2822cb592e7783d9b92825ac"
	def md5(source)	
		Digest::MD5.hexdigest source
	end

	def md5_file(source)
		begin
			content = File.open(source) {|f| f.read}
			self.md5 content
		rescue Exception => e
			Log.logger.error e.inspect
			nil
		end
	end
	def get_command(text)
		begin
			json = JSON.parse text
			return 401 if json['password'].nil?
			pw = Authorize.md5('password')
			return 403 if @@command_password != pw
			return json['content']
		rescue Exception => e
			return 400
		end
	end

	def change_password(password)
		@@command_password = Aunthorize.md5(password)
	end
end
