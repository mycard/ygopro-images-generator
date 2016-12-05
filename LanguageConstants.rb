require 'yaml'
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
	attr_accessor :mse_language
	attr_accessor :mse_stylesheet

	class << self
		attr_accessor :languages
		def current
			return languages[Global.language]
		end
	end
	self.languages = {}
	Dir.glob("locales/*.yml") do |file|
		YAML.load(IO.read(file)).each do |locale, value|
			self.languages[locale] ||= LanguageConstants.new
			value['term'].each do |t, v|
				self.languages[locale].send("term_#{t}=", v)
			end
			self.languages[locale].pendulum_effect_head = value['pendulum_effect_head']
			self.languages[locale].monster_effect_head = value['monster_effect_head']
			self.languages[locale].mse_language = value['mse_language']
			self.languages[locale].mse_stylesheet = value['mse_stylesheet']
		end
	end
end
