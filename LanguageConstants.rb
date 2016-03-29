require File.dirname(__FILE__) + '/Global.rb'

class LanguageConstants
	attr_accessor :term_monster
	attr_accessor :term_spell
	attr_accessor :term_trap
	attr_accessor :term_normal
	attr_accessor :term_effect
	attr_accessor :term_fusion
	attr_accessor :term_ritual
	attr_accessor :term_trapmonster
	attr_accessor :term_spirit
	attr_accessor :term_union
	attr_accessor :term_dual
	attr_accessor :term_tuner
	attr_accessor :term_synchro
	attr_accessor :term_token
	attr_accessor :term_quickplay
	attr_accessor :term_continuous
	attr_accessor :term_equip
	attr_accessor :term_field
	attr_accessor :term_counter
	attr_accessor :term_flip
	attr_accessor :term_cartoon
	attr_accessor :term_xyz
	attr_accessor :term_pendulum
	attr_accessor :pendulum_effect_head
	attr_accessor :monster_effect_head
	attr_accessor :term_races # 偷个鸡

	class << self
		attr_accessor :languages
		def current
			return languages[Global.language]
		end
	end
	self.languages = {}
end

language_chinese = LanguageConstants.new
language_chinese.term_monster = "怪兽卡"
language_chinese.term_spell = "魔法卡"
language_chinese.term_trap = "陷阱卡"
language_chinese.term_normal = "通常"
language_chinese.term_effect = "效果"
language_chinese.term_fusion = "融合"
language_chinese.term_ritual = "仪式"
language_chinese.term_trapmonster = "陷阱怪兽"
language_chinese.term_spirit = "灵魂"
language_chinese.term_union = "同盟"
language_chinese.term_dual = "二重"
language_chinese.term_tuner = "调整"
language_chinese.term_synchro = "同调"
language_chinese.term_token = "衍生物"
language_chinese.term_quickplay = "速攻"
language_chinese.term_continuous = "永续"
language_chinese.term_equip = "装备"
language_chinese.term_field = "场地"
language_chinese.term_counter = "反击"
language_chinese.term_flip = "反转"
language_chinese.term_cartoon = "卡通"
language_chinese.term_xyz = "XYZ"
language_chinese.term_pendulum = "灵摆"
language_chinese.pendulum_effect_head = /←\d 【灵摆】 \d→(\n)?/
language_chinese.monster_effect_head = "\n【怪兽效果】\n"
language_chinese.term_races = [
	"",
	"战士族",
	"魔法使族",
	"天使族",
	"恶魔族",
	"不死族",
	"机械族",
	"水族",
	"炎族",
	"岩石族",
	"鸟兽族",
	"植物族",
	"昆虫族",
	"雷族",
	"龙族",
	"兽族",
	"兽战士族",
	"恐龙族",
	"鱼族",
	"海龙族",
	"爬虫族",
	"念动力族",
	"幻兽神族",
	"创世神族",
	"幻龙族"
] # K 社你敢出个原生双种族怪试试？

language_japanese = LanguageConstants.new
language_japanese.term_monster = "モンスター"
language_japanese.term_spell = "魔法カード"
language_japanese.term_trap = "罠カード"
language_japanese.term_normal = "通常"
language_japanese.term_effect = "効果"
language_japanese.term_fusion = "融合"
language_japanese.term_ritual = "儀式"
language_japanese.term_trapmonster = "罠モンスター"
language_japanese.term_spirit = "スピリット"
language_japanese.term_union = "ユニオン"
language_japanese.term_dual = "デュアル"
language_japanese.term_tuner = "チューナー"
language_japanese.term_synchro = "シンクロ"
language_japanese.term_token = "トークン"
language_japanese.term_quickplay = "速攻"
language_japanese.term_continuous = "永続"
language_japanese.term_equip = "装備"
language_japanese.term_field = "フィールド"
language_japanese.term_counter = "カウンター"
language_japanese.term_flip = "リバース"
language_japanese.term_cartoon = "トゥーン"
language_japanese.term_xyz = "エクシーズ"
language_japanese.term_pendulum = "ペンデュラム"
language_japanese.pendulum_effect_head = /【Ｐスケール：青(.*)／赤(.*)】(\n)?/
language_japanese.monster_effect_head = /(\n)?【モンスター効果】\n/
language_japanese.term_races = [
	"",
	"戦士族",
	"魔法使い族",
	"天使族",
	"悪魔族",
	"アンデット族",
	"機械族",
	"水族",
	"炎族",
	"岩石族",
	"鳥獣族",
	"植物族",
	"昆虫族",
	"雷族",
	"ドラゴン族",
	"獣族",
	"獣戦士族",
	"恐竜族",
	"魚族",
	"海竜族",
	"爬虫類族",
	"サイキック族",
	"幻神獣族",
	"創造神族",
	"幻竜族"
] 

LanguageConstants.languages['cn'] = language_chinese
LanguageConstants.languages['jp'] = language_japanese