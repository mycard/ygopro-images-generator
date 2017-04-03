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

	def generate_delta(languages = nil, export = true)
		Log.logger.info "Generate delta card image(s) with parameter: #{languages.inspect}"
		if languages == nil
			process_generate_delta(export)
		else
			for language in languages
				Global.language = language
				process_generate_delta(export)
			end
		end
	end

	def process_generate_delta(export = true)
		Log.logger.info "Generate delta card image with language #{Global.language}"
		self.clear_mse
		data = Sqlite.load # Language effected here
		changes = HashJudger.compare data
		generates = changes[0] + changes[2]
		removes = changes[1]
		# 这两句是暂时排除 Bug 用。
		generates = generates.select { |card| card != nil }
		removes = removes.select { |card| card != nil }
		# 因此可能导致无法预期的后果。
		data = Sqlite.split generates
		for card in removes
			id = YGOCoreJudgers.get_id card
			path = File.join Global.full_answer_path, id.to_s + Global.image_type
			File.delete path if File.exist? path
			path = File.join Global.full_answer_path, 'thumbnail', id.to_s + Global.image_type
			File.delete path if File.exist? path
		end
		MSETranslator.generate_mse_all(data)
		MSETranslator.export_mse_all if export
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
