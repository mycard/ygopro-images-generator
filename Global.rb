# Global Settings

module Global
	class << self
		attr_accessor :language
		attr_accessor :git_path
		attr_accessor :git_uri
		attr_accessor :database_name
		attr_accessor :image_type
		attr_accessor :records_name
		attr_accessor :answer_path
		attr_accessor :answer_uri
		attr_accessor :mse_path
		attr_accessor :mse_set_path
		attr_accessor :sql_fix_name
	end
	self.language = 'cn'
	self.git_path = 'ygopro-images-raw'
	self.git_uri = 'https://github.com/mycard/ygopro-images-raw.git'
	self.database_name = 'cards-%s.cdb'
	self.image_type = '.jpg'
	self.records_name = "records.json"
	self.answer_path = "ygopro-images"
	self.answer_uri = "https://github.com/mycard/ygo-images.git"
	self.mse_path = "MagicSetEditor2"
	self.sql_fix_name = "fix.sql"
	self.mse_set_path = "mse-sets"
	module_function
	def full_database_path
		return File.join self.git_path, sprintf(self.database_name, self.language)
	end

	def full_image_path
		return self.git_path
	end

	def full_answer_path
		return self.answer_path
	end
	
	def full_image_name(id)
		id = id.to_i.to_s
		return File.join self.full_image_path, id + self.image_type
	end

	def full_mse_path
		return File.join self.mse_path, 'mse.com'
	end
end