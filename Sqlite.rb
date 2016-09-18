# encoding: UTF-8
require 'sqlite3'
require 'fileutils'
require File.dirname(__FILE__) + '/Git.rb'
require File.dirname(__FILE__) + '/Global.rb'
require File.dirname(__FILE__) + '/Log.rb'
require File.dirname(__FILE__) + '/MSEConstants.rb'

module Sqlite
	def self.load(id = -1)
		path = Global.full_database_path
		if File.exist? path
			FileUtils.cp path, Global.temp_database_name
		else
			Log.logger.error "No sql databse named #{path}"
			return nil
		end
		begin
			db = SQLite3::Database.new Global.temp_database_name
			self.run_fix(db)
			command = "select * from datas join texts on datas.id == texts.id"
			command += " where datas.id == #{id}" if id > 0
			ans = db.execute command
			db.close
			ans
		rescue Exception => e
			Log.logger.error "Failed to load sql while running command: #{command}."
			Log.logger.error e.inspect
			nil
		end
	end

	def self.run_fix(db)
		if File.exist?(Global.sql_fix_name)
			begin
				Log.logger.info "Going to run fix sql"
				content = File.open(Global.sql_fix_name) {|f| f.read}
				db.execute(content)
			rescue Exception => e
				Log.logger.error "Failed to run the sql fix."
				Log.logger.error e.inspect
			end
		else
			Log.logger.warn "No file named #{Global.sql_fix_name}. Skip the sql fix process."
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
