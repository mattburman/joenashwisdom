require 'twitter_ebooks'
require 'sinatra'
require 'json'

set :port, 8183

class Nash < Sinatra::Base
  set :port, 8183
  model = Ebooks::Model.load("model/jna_sh.model")

  def initialize
    super()
    @FILE = "wisdom_number.txt"
  end

  get '/' do
    length = 140
    @wisdom = model.make_statement(length)
    wisdom_number = File.read(@FILE).to_i+1
    File.open(@FILE, 'w') { |file| file.write(wisdom_number) }
    @wisdomNumber = wisdom_number
    erb :index
  end

  get '/api' do
    content_type :json
    wisdom_number = File.read(@FILE).to_i+1
    File.open(@FILE, 'w') { |file| file.write(wisdom_number) }
    length = 140
    { :wisdom => model.make_statement(length), :wisdomNumber => wisdom_number }.to_json
  end
end

Nash.run!

