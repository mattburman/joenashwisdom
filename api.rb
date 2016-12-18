require 'twitter_ebooks'
require 'sinatra'
set :port, 8183

model = Ebooks::Model.load("model/jna_sh.model")

get '/api' do
  model.make_statement(140)
end

