# sinatra server core

require "sinatra"
require File.dirname(__FILE__) + "/Git.rb"
require File.dirname(__FILE__) + "/Command.rb"

post '/command' do
	
end

post '/hook' do
	Git.pull
	Commands.generate_delta
	Git.commit
	Git.push
end