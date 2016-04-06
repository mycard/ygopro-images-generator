#!/usr/bin/env ruby

# sinatra server core

require "sinatra"
require File.dirname(__FILE__) + "/Git.rb"
require File.dirname(__FILE__) + "/Commands.rb"

# 由于卡图生成时间太长，因此应该收到请求之后立即给一个 2xx 的回复，以防调用的那边认为网络超时而进行不必要的重新请求等操作。
# 如果在一次生成完毕之前，又进来了多个调用，按如下方式处理：
# 1. 如果当前是空闲中，立即启动生成
# 2. 如果当前正在生成中，做一个【存在队列中的请求】的标记
# 3. 当生成完毕之后，如果存在队列标记，重新启动生成

def generate
    system('./generate.sh')
    if settings.status == :queued
        settings.status = :running 
        generate
    else
        settings.status = :idle
    end
end

configure do
    set :status, :running
    Thread.new { generate }
end

post '/hook' do
    status 204
    if settings.status == :idle
        settings.status = :running 
        Thread.new { generate }
    else
        settings.status = :queued
    end
end
