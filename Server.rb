# sinatra server core

require "sinatra"
require File.dirname(__FILE__) + "/Git.rb"
require File.dirname(__FILE__) + "/Commands.rb"

post '/command' do
	
end

post '/hook' do
	Git.pull
	Commands.generate_delta(Commands.get_languages)
	Git.commit
	Git.push
end
