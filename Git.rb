# git commands

require File.dirname(__FILE__) + '/Global.rb'

module Git
	module_function

	def pull
		return `cd #{global.git_path} && git pull`
	end

	def push
		return `cd #{global.answer_path} && git push`
	end

	def commit

	end

	def hook

	end
end