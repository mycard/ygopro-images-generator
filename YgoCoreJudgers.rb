
=begin
CREATE TABLE datas(
	0 - id integer primary key,
	1 - ot integer,
	2 - alias integer,
	3 - setcode integer,
	4 - type integer,
	5 - atk integer,
	6 - def integer,
	7 - level integer,
	8 - race integer,
	9 - attribute integer,
	10 - category integer);
CREATE TABLE texts(
	11 - id integer primary key,
	12 - name text,
	13 - desc text,
	str1 text,
	str2 text,
	str3 text,
	str4 text,
	str5 text,
	str6 text,
	str7 text,
	str8 text,
	str9 text,
	str10 text,
	str11 text,
	str12 text,
	str13 text,
	str14 text,
	str15 text,
	str16 text);
select * from datas join 
=end

require File.dirname(__FILE__) + '/YgocoreConstants.rb'
require File.dirname(__FILE__) + '/MSEConstants.rb'
require File.dirname(__FILE__) + '/LanguageConstants.rb'

module YGOCoreJudgers
	ColumnID = 0
	ColumnType = 4
	ColumnAtk = 5
	ColumnDef = 6
	ColumnLevel = 7
	ColumnRace = 8
	ColumnAttribute = 9
	ColumnName = 12
	ColumnDesc = 13
	module_function
	def is_monster(card)
		return card[ColumnType] & YGOCoreConstants::Type::Monster != 0
	end

	def is_spell(card)
		return card[ColumnType] & YGOCoreConstants::Type::Spell != 0
	end

	def is_trap(card)
		return card[ColumnType] & YGOCoreConstants::Type::Trap != 0
	end

	def is_normal(card)
		return card[ColumnType] & YGOCoreConstants::Type::Normal != 0
	end

	def is_effect(card)
		return card[ColumnType] & YGOCoreConstants::Type::Effect != 0
	end

	def is_fusion(card)
		return card[ColumnType] & YGOCoreConstants::Type::Fusion != 0
	end

	def is_ritual(card)
		return card[ColumnType] & YGOCoreConstants::Type::Ritual != 0
	end

	def is_spirit(card)
		return card[ColumnType] & YGOCoreConstants::Type::Spirit != 0
	end

	def is_union(card)
		return card[ColumnType] & YGOCoreConstants::Type::Union != 0
	end

	def is_dual(card)
		return card[ColumnType] & YGOCoreConstants::Type::Dual != 0
	end

	def is_tuner(card)
		return card[ColumnType] & YGOCoreConstants::Type::Tuner != 0
	end

	def is_sync(card)
		return card[ColumnType] & YGOCoreConstants::Type::Synchro != 0
	end

	def is_token(card)
		return card[ColumnType] & YGOCoreConstants::Type::Token != 0
	end

	def is_quickplay(card)
		return card[ColumnType] & YGOCoreConstants::Type::Quickplay != 0
	end

	def is_continuous(card)
		return card[ColumnType] & YGOCoreConstants::Type::Continuous != 0
	end

	def is_equip(card)
		return card[ColumnType] & YGOCoreConstants::Type::Equip != 0
	end

	def is_field(card)
		return card[ColumnType] & YGOCoreConstants::Type::Field != 0
	end

	def is_counter(card)
		return card[ColumnType] & YGOCoreConstants::Type::Counter != 0
	end

	def is_flip(card)
		return card[ColumnType] & YGOCoreConstants::Type::Flip != 0
	end

	def is_cartoon(card)
		return card[ColumnType] & YGOCoreConstants::Type::Cartoon != 0
	end

	def is_xyz(card)
		return card[ColumnType] & YGOCoreConstants::Type::Xyz != 0
	end

	def is_pendulum(card)
		return card[ColumnType] & YGOCoreConstants::Type::Pendulum != 0
	end

	def get_id(card)
		return card[ColumnID].to_i
	end

	def get_id_str(card)
		return sprintf "%08d", self.get_id(card)
	end

	def get_desc(card)
		return card[ColumnDesc]
	end

	def get_name(card)
		return card[ColumnName]
	end

	def get_attack(card)
		return card[ColumnAtk].to_i
	end

	def get_defense(card)
		return card[ColumnDef].to_i
	end

	def get_level(card)
		return card[ColumnLevel].to_i % YGOCoreConstants::PendulumLeftMod
	end

	def get_monster_level_str(card)
		return MSEConstants::MSESpellTrap::Level * self.get_level(card)
	end

	def get_spell_level_str(card)
		appendix = ""
		if self.is_equip card
			appendix = MSEConstants::MSESpellTrap::Equip
		elsif self.is_quickplay card
			appendix = MSEConstants::MSESpellTrap::Quickplay
		elsif self.is_field card
			appendix = MSEConstants::MSESpellTrap::Field
		elsif self.is_continuous card
			appendix = MSEConstants::MSESpellTrap::Continuous
		elsif self.is_ritual card
			appendix = MSEConstants::MSESpellTrap::Ritual
		else
			appendix = MSEConstants::MSESpellTrap::Normal
		end
		return MSEConstants::MSESpellTrap.model appendix
		return "【" + LanguageConstants.current.term_spell + appendix + "】"
	end

	def get_trap_level_str(card)
		appendix = ""
		if self.is_continuous card
			appendix = MSEConstants::MSESpellTrap::Continuous
		elsif self.is_counter card
			appendix = MSEConstants::MSESpellTrap::Counter
		else
			appendix = MSEConstants::MSESpellTrap::Normal
		end
		return MSEConstants::MSESpellTrap.model appendix
		return "【" + LanguageConstants.current.term_trap + appendix + "】"
	end

	def get_level_str(card)
		if self.is_monster(card)
			get_monster_level_str card
		elsif self.is_spell(card)
			get_spell_level_str card
		elsif self.is_trap(card)
			get_trap_level_str card
		end
	end

	def get_race(card)
		return card[ColumnRace].to_i
	end

	def get_race_str(card)
		race = self.get_race card
		if race == YGOCoreConstants::Race::None
			return LanguageConstants.current.term_races[0]
		else
			index = Math.log race, 2 # 我不管我就是要偷鸡！
			return LanguageConstants.current.term_races[index.floor + 1]
		end
	end

	def get_pendulum_scale(card)
		return card[ColumnLevel] / YGOCoreConstants::PendulumRightMod
	end

	def get_image_str(card)
		id = self.get_id(card)
		return "#{id}#{Global.image_type}"
	end

	def get_monster_attribute(card)
		return card[ColumnAttribute].to_i
	end

	def get_monster_attribute_str(card)
		attribute = self.get_monster_attribute card
		if attribute & YGOCoreConstants::Attribute::Earth != 0
			return MSEConstants::MSEAttribute::Earth
		elsif attribute & YGOCoreConstants::Attribute::Water != 0
			return MSEConstants::MSEAttribute::Water
		elsif attribute & YGOCoreConstants::Attribute::Fire != 0
			return MSEConstants::MSEAttribute::Fire
		elsif attribute & YGOCoreConstants::Attribute::Wind != 0
			return MSEConstants::MSEAttribute::Wind
		elsif attribute & YGOCoreConstants::Attribute::Light != 0
			return MSEConstants::MSEAttribute::Light
		elsif attribute & YGOCoreConstants::Attribute::Dark != 0
			return MSEConstants::MSEAttribute::Dark
		elsif attribute & YGOCoreConstants::Attribute::Divine != 0
			return MSEConstants::MSEAttribute::Divine
		else
			return MSEConstants::MSEAttribute::None
		end
	end

	def get_spell_attribute_str(card)
		return MSEConstants::MSEAttribute::Spell
	end

	def get_trap_attribute_str(card)
		return MSEConstants::MSEAttribute::Trap
	end

	def get_attribute_str(card)
		if self.is_monster(card)
			return self.get_monster_attribute_str(card)
		elsif self.is_spell(card)
			return self.get_spell_attribute_str(card)
		elsif self.is_trap(card)
			return self.get_trap_attribute_str(card)
		else
			MSEConstants::MSEAttribute::None
		end
	end

	def get_cardtype_str(card)
		if self.is_spell card
				return MSEConstants::MSECardType::Spell
		elsif self.is_trap card
			return MSEConstants::MSECardType::Trap
		elsif self.is_monster card
			if self.is_token card
				race = self.get_race card
				if race == 0
					return MSEConstants::MSECardType::Token2
				else
					return MSEConstants::MSECardType::Token
				end
			elsif self.is_normal card
				return MSEConstants::MSECardType::Normal
			elsif self.is_xyz card
				return MSEConstants::MSECardType::Xyz
			elsif self.is_ritual card
				return MSEConstants::MSECardType::Ritual
			elsif self.is_fusion card
				return MSEConstants::MSECardType::Fusion
			elsif self.is_sync card
				return MSEConstants::MSECardType::Synchro
			elsif self.is_effect card
				return MSEConstants::MSECardType::Effect
			end
		else
			return ""
		end	
	end

	def get_cardtypes_str(card)
		return ["", "", "", ""] if !(self.is_monster card)
		types = [self.get_race_str(card)]
		# 黑蓝紫白绿
		types.push LanguageConstants.current.term_xyz if self.is_xyz card
		types.push LanguageConstants.current.term_ritual if self.is_ritual card
		types.push LanguageConstants.current.term_fusion if self.is_fusion card
		types.push LanguageConstants.current.term_synchro if self.is_sync card
		types.push LanguageConstants.current.term_pendulum if self.is_pendulum card
		# 子类别
		types.push LanguageConstants.current.term_spirit if self.is_spirit card
		types.push LanguageConstants.current.term_union if self.is_union card
		types.push LanguageConstants.current.term_dual if self.is_dual card
		types.push LanguageConstants.current.term_tuner if self.is_tuner card
		types.push LanguageConstants.current.term_cartoon if self.is_cartoon card
		# 效果 - 通常
		types.push LanguageConstants.current.term_effect if self.is_effect card
		types.push "" until types.size == 4
		types
	end

	def get_log_str(card)
		"[#{self.get_id_str(card)}]#{self.get_name(card)}"
	end
end