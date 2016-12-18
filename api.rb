require 'twitter_ebooks'
require 'sinatra'
require 'json'

set :port, 8183

class Nash < Sinatra::Base
  set :port, 8183
  model = Ebooks::Model.load("model/jna_sh.model")
  get '/' do
    @wisdomNumber = 0
    length = 140
    @wisdom = model.make_statement(length)
    erb :index
  end

  get '/api' do
    content_type :json
    length = 140
    { :wisdom => model.make_statement(length), :wisdomNumber => 0 }.to_json
  end
end

Nash.run!

