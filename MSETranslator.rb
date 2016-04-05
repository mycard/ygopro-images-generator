require File.dirname(__FILE__) + '/MSEConstants.rb'
require File.dirname(__FILE__) + '/YgoCoreJudgers.rb'
require File.dirname(__FILE__) + '/Global.rb'
require File.dirname(__FILE__) + '/Log.rb'
require 'zip'

module MSETranslator
	module_function

	def write_set(file, set)
		file.write(sprintf(MSEConstants::MSEConfig::Head, LanguageConstants.current.mse_language.upcase))
		for card in set
			self.write_card(file, card)
		end
		file.write(MSEConstants::MSEConfig::End)
	end

	def write_card(file, card)
		if (YGOCoreJudgers.is_monster(card))
			self.write_monster(file, card)
		else
			self.write_spell(file, card)
		end
	end

	def write_monster(file, card)
		file.write "\n#{MSEConstants::MSETags::TagCard}:\n"
		file.write self.generate_line MSEConstants::MSETags::TagCardType, YGOCoreJudgers.get_cardtype_str(card)
		file.write self.generate_line MSEConstants::MSETags::TagName, YGOCoreJudgers.get_name(card)
		file.write self.generate_line MSEConstants::MSETags::TagAttribute, YGOCoreJudgers.get_attribute_str(card)
		file.write self.generate_line MSEConstants::MSETags::TagLevel, YGOCoreJudgers.get_level_str(card)
		file.write self.generate_line MSEConstants::MSETags::TagImage, YGOCoreJudgers.get_image_str(card)
		types = YGOCoreJudgers.get_cardtypes_str card
		file.write self.generate_line MSEConstants::MSETags::TagType1, types[0]
		file.write self.generate_line MSEConstants::MSETags::TagType2, types[1]
		file.write self.generate_line MSEConstants::MSETags::TagType3, types[2]
		file.write self.generate_line MSEConstants::MSETags::TagType4, types[3]
		# pack id. Ignored.
		if YGOCoreJudgers.is_pendulum card
			pendulum_effect, monster_effect = self.split_effect(YGOCoreJudgers.get_desc(card))
			file.write self.generate_text MSEConstants::MSETags::TagText, monster_effect
			file.write self.generate_line MSEConstants::MSETags::TagPendulum, "medium"
			file.write self.generate_line MSEConstants::MSETags::TagPScale1, YGOCoreJudgers.get_pendulum_scale(card)
			file.write self.generate_line MSEConstants::MSETags::TagPScale2, YGOCoreJudgers.get_pendulum_scale(card)
			file.write self.generate_text MSEConstants::MSETags::TagPEndText, pendulum_effect
		else
			file.write self.generate_text MSEConstants::MSETags::TagText, YGOCoreJudgers.get_desc(card)
		end
		file.write self.generate_line MSEConstants::MSETags::TagAtk, YGOCoreJudgers.get_attack(card)
		file.write self.generate_line MSEConstants::MSETags::TagDef, YGOCoreJudgers.get_defense(card)
		file.write self.generate_line MSEConstants::MSETags::TagCode, YGOCoreJudgers.get_id(card).to_s
	end

	def write_spell(file, card)
		file.write "\n#{MSEConstants::MSETags::TagCard}:\n"
		file.write self.generate_line MSEConstants::MSETags::TagCardType, YGOCoreJudgers.get_cardtype_str(card)
		file.write self.generate_line MSEConstants::MSETags::TagName, YGOCoreJudgers.get_name(card)
		file.write self.generate_line MSEConstants::MSETags::TagAttribute, YGOCoreJudgers.get_attribute_str(card)
		file.write self.generate_line MSEConstants::MSETags::TagLevel, YGOCoreJudgers.get_level_str(card)
		file.write self.generate_line MSEConstants::MSETags::TagImage, YGOCoreJudgers.get_image_str(card)
		file.write self.generate_text MSEConstants::MSETags::TagText, YGOCoreJudgers.get_desc(card)
		file.write self.generate_line MSEConstants::MSETags::TagCode, YGOCoreJudgers.get_id(card).to_s
	end

	LineHead = "\t"#"	"
	def generate_line(key, word)
		"#{LineHead}#{key}: #{word}\n"
	end

	def reline(word)
		word.delete "\r\n"
	end

	def generate_text(key, word)
		word = self.reline word
		ans = LineHead + key + ":\n"
		lines = word.split "\n"
		lines.each {|line| ans += "#{LineHead}#{LineHead}#{line}\n"}
		ans
	end

	def split_effect(word)
		word = reline word
		words = word.split LanguageConstants.current.monster_effect_head
		return ["", words[0]] if words.count <= 1
		pendulum_effect = words[0].split(LanguageConstants.current.pendulum_effect_head).last
		pendulum_effect = "" if pendulum_effect == nil
		return [pendulum_effect, words[1]]
	end

	def generate_mse(data, key = "")
		path = File.join Global.mse_set_path, "data#{key}-#{Global.language}.mse-set" 
		clear_data = []
		Zip::File.open(path, Zip::File::CREATE) do |zipfile|
			for card in data
				id = YGOCoreJudgers.get_id card
				image_name = Global.full_image_name(id)
				if File.exist? image_name
					zipfile.add id.to_s + Global.image_type, image_name
					clear_data.push card
				else
					Log.logger.warn "#{YGOCoreJudgers.get_log_str(card)} has no proper image for. Skipped."
				end
			end
			zipfile.get_output_stream(MSEConstants::SetFileName) { |os| write_set(os, clear_data) }
		end
		Log.logger.info("Finished a pack named data#{key}-#{Global.language}.mse-set with following #{clear_data.count} cards:")
		clear_data.each {|card| Log.logger.info(YGOCoreJudgers.get_log_str(card))}
	end

	def generate_mse_all(datas)
		for i in 0...datas.size
			generate_mse(datas[i], i)
		end	
	end

	def export_mse(full_file_name)
		mse = Global.full_mse_path
		command = "wine32 #{mse} --export #{full_file_name} #{Global.full_answer_path}/{card.gamecode}.jpg"
		Log.logger.info "exporting #{full_file_name} command is: #{command}"
		`#{command}`
	end

	def export_mse_all
		Dir.glob("#{Global.mse_set_path}/*.mse-set") {|set| self.export_mse(set)}
	end
end
