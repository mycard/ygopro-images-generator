require 'sqlite3'
require File.dirname(__FILE__) + '/Git.rb'
require File.dirname(__FILE__) + '/Global.rb'
require File.dirname(__FILE__) + '/Log.rb'
require File.dirname(__FILE__) + '/MSEConstants.rb'

module Sqlite
	def self.load
		begin
			db = SQLite3::Database.new Global.full_database_path
			db.execute "select * from datas join texts on datas.id == texts.id"
		rescue Exception => e
			Log.logger.error e.inspect
			nil
		end
	end

	def self.split(data)
		size = MSEConstants::SingleFileMaxCount
		count = (data.size - 1) / size + 1
		ans = []
		for i in 0...count
			range = Range.new(i * size, (i + 1) * size - 1)
			ans.push data[range]
		end
		ans
	end
end
