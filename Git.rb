# git commands

require File.dirname(__FILE__) + '/Global.rb'

module Git
	module_function

	def pull
		return `cd #{Global.git_path} && git pull`
	end

	def push
		return `cd #{Global.answer_path} && git push`
	end

	def commit(message = "")
		return `cd #{Global.answer_path} && git add . && git commit -a -m \"Update card images\"`
	end
end