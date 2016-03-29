# Judge the hash.
# offer the CSV version and JSON Version.
# Use the JSON Version.

require 'JSON'
require File.dirname(__FILE__) + '/Authorize.rb'
require File.dirname(__FILE__) + '/Global.rb'
require File.dirname(__FILE__) + '/Log.rb'
require File.dirname(__FILE__) + '/Sqlite.rb'

module HashJudger
	module_function
	def load
		begin
			content = File.open(Global.records_name, "r") {|f| f.read}
			return JSON.parse content
		rescue Exception => e
			Log.logger.error e.inspect
			return {}
		end
	end

	def save(document)
		file = File.open Global.records_name, "w"
		file.write document.to_json
		file.close
	end

	def generate_hash(image_id, server_data)
		image_path = Global.full_image_name image_id
		if !File.exist? image_path
			Log.logger.info("Unexist file #{image_path} for id #{image_id}. Skip.")
			return nil
		end
		data = server_data.join '|'
		return [Authorize.md5_file(image_path), Authorize.md5(data)]
	end

	def generate_document(sql_data)
		answer = {}
		for data in sql_data
			id = data[0]
			hash = self.generate_hash id, data
			answer[id.to_s] = hash if hash != nil
		end 
		return answer 
	end

	def compare
		# 读取两组数据
		old_data = self.load
		new_data = generate_document(Sqlite.load)
		# 生成编号序列
		# 添加
		adds = new_data.keys - old_data.keys
		if adds == []
			Log.logger.info "No cards added."
		else
			Log.logger.info "Following cards added:"
			adds.each {|id| Log.logger.info "#{[id]}"}
		end
		# 移除
		removes = old_data.keys - new_data.keys
		if removes == []
			Log.logger.info "No cards remvoed."
		else
			Log.logger.info "Following cards removed:"
			removes.each {|id| Log.logger.info "#{[id]}"}
		end
		# 公共部分
		commons = new_data.keys & old_data.keys
		changes = []
		Log.logger.info "Following cards changed"
		# 逐个比较
		for id in commons
			old_piece = old_data[id]
			new_piece = new_data[id]
			if old_piece[0] != new_piece[0] and old_piece[1] != new_piece[1]
				Log.logger.info "[#{id}] Both changed"
				changes.push id
			elsif old_piece[0] != new_piece[0]
				Log.logger.info "[#{id}] image changed"
				changes.push id
			elsif old_piece[1] != new_piece[1]
				Log.logger.info "[#{id}] data changed"
				changes.push id
			end
		end
		Log.logger.info "Oooooops but no data or file changed." if changes == []
		# 保存新数据
		self.save new_data
		# 返还
		return [adds, removes, changes]
	end
end