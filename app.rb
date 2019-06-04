require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/' do
    erb :user_input
  end
  
  post '/piglatinize' do
    puts params[:user_phrase]
    @latinized_phrase = PigLatinizer.new.piglatinize(params[:user_phrase])
    erb :results
  end
end