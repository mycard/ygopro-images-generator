# Commands Reflector
require File.dirname(__FILE__) + '/Global.rb'
require File.dirname(__FILE__) + '/Sqlite.rb'
require File.dirname(__FILE__) + '/MSETranslator.rb'
require File.dirname(__FILE__) + '/HashJudger.rb'
require File.dirname(__FILE__) + '/Log.rb'

module Commands
	module_function
	def execute(command)

	end

	def change_password(password)
		Authorize.change_password password
	end

	def generate_all
		Log.logger.info "Generate all the card images with language #{Global.language}."
		self.clear_mse
  	data = Sqlite.split Sqlite.load
  	MSETranslator.generate_mse_all(data)
  	MSETranslator.export_mse_all
	end

	def generate_delta(languages = nil)
		Log.logger.info "Generate delta card image(s)"
		self.clear_mse
		data = Sqlite.load
		changes = HashJudger.compare data
		generates = changes[0] + changes[2]
		removes = changes[1]
		data = Sqlite.split generates
		if languages == nil
			process(removes, data)
		else
			for language in languages
				Global.language = language
				process(removes, data)
			end
		end
	end

	def process(removes, data)
		for card in removes
			id = YGOCoreJudgers.get_id card
			path = File.join Global.full_answer_path, id.to_s + Global.image_type
			File.delete path if File.exist? path
		end
  	MSETranslator.generate_mse_all(data)
  	MSETranslator.export_mse_all
	end

	def generate_single(id)
		Log.logger.info "Generate single card image #{id}"
		self.clear_mse
		MSETranslator.generate_mse Sqlite.load(id)
		MSETranslator.export_mse_all
	end

	def clear_mse
		Log.logger.info "Clearing MSE Path"
		Dir.glob("#{Global.mse_set_path}/*.mse-set") {|set| File.delete set}
	end

	def get_languages
		names = Dir.glob("#{Global.full_image_path}/cards-*.cdb")
		languages = names.map {|name| File.basename(name)}.map {|name| name[6, name.length - 10]}
		languages
	end

end