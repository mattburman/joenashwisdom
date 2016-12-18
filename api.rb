require 'twitter_ebooks'
require 'sinatra'

model = Ebooks::Model.load("model/jna_sh.model")
lol = model.make_statement(140)

get '/' do
  model.make_statement(140)
end

