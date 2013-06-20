require 'rubygems'
require 'sinatra'
require 'json'

get '/clients/kathyaperkins/hooks/deploy/:env' do
  if env[:params] == 'stage'
    `cd ~/ClientWork/kathyaperkins.com && git pull`
    content_type :json
    { status: 'ok' }.to_json
  end
end
