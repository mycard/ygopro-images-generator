# mse set constants

module MSEConstants
	module MSEConfig
		Tag = "mse"
		TagHead = "head"
		TagEnd = "end"
		TagCn2Tw = "cn2tw"
		TagSpell = "spell"
		TagTrap = "trap"
		TagRegPendulum = "pendulum-text"
		TagRegMonster = "monster-text"
		TagMaxCount = "maxcount"
		TagRace = "race"
		TagType = "type"
		TagWidth = "width"
		TagHeight = "height"

		TagReimage = "reimage"
		TagPendWidth = "pwidth"
		TagPendHeight = "pheight"

		TagImage = "imagepath"
		TagReplace = "replace"
		TagText = "text"

		TagRep = "%%"
		SepLine = " "

		FileConfigName = "Chinese-Simplified"
		PathImage = "Images"
		
		Head = "mse version: 0.3.8\ngame: yugioh\nstylesheet: standard\nset info:\n\tlanguage: %s\n\tedition: \n\tno corner: yes\tST mark is text: yes\n\tpendulum image is small: yes\n\thide gamecode: yes\n"
		End = "version control:\n\ttype: none\napprentice code: "

		Width = 319
		Height = 317
		PWidth = 363
		PHeight = 275
	end

	module MSETags
		TagCard = "card"
		TagCardType = "card type"
		TagName = "name"
		TagAttribute = "attribute"
		TagLevel = "level"
		TagImage = "image"
		TagType1 = "type 1" # 种族
		TagType2 = "type 2" # 效果1
		TagType3 = "type 3" # 效果2
		TagType4 = "type 4" # 效果3
		TagText = "rule text"
		TagAtk = "attack"
		TagDef = "defense"
		TagNumber = "number"
		TagRarity = "rarity"
		TagPendulum = "pendulum"
		TagPScale1 = "pendulum scale 1"
		TagPScale2 = "pendulum scale 2"
		TagPEndText = "pendulum text"
		TagCode = "gamecode"
		UnknownAtkDef = "?"
		UnknownAtkDefValue = -2
		TagRepText = "%text%"
		TagRepPText = "%ptext%"
	end

	module MSEAttribute
		None = "none"
		Dark = "dark"
		Divine = "divine"
		Earth = "earth"
		Fire = "fire"
		Light = "light"
		Water = "water"
		Wind = "wind"
		Spell = "spell"
		Trap = "trap"
	end

	module MSESpellTrap
		Equip = "+"
		Quickplay = "$"
		Field = "&"
		Continuous = "%"
		Ritual = "#"
		Counter = "!"
		Normal = "^"
		Level = "*"
		Model = "<sym-auto>%s</sym-auto>"
		def self.model(para)
			return sprintf Model, para 
		end
	end

	module MSECardType
		Normal = "normal monster"
		Effect = "effect monster"
		Xyz  = "xyz monster"
		Ritual = "ritual monster"
		Fusion = "fusion monster"
		Token = "token monster"
		Token2 = "token card"
		Synchro = "synchro monster"
		Spell = "spell card"
		Trap = "trap card"
		Special = {10000001 => "obelisk", 10000011 => "ra", 10000021 => "slifer"} 
	end

	SetFileName = "set"
	SingleFileMaxCount = 200
end
