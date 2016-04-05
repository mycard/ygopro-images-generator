# sinatra server core

require "sinatra"
require File.dirname(__FILE__) + "/Git.rb"
require File.dirname(__FILE__) + "/Commands.rb"

post '/command' do
	
end

post '/hook' do
	system('./generate.sh')
end
