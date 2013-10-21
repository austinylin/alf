require 'rubygems'
require 'sinatra'
require 'json'

post '/clients/kathyaperkins/hooks/deploy/:env' do
  if params[:env] == 'stage'
    msg = `/home/austin/ClientWork/kathyaperkins.com/script/deploy`
    content_type :json
    { status: 'ok', msg: msg }.to_json
  end
end
