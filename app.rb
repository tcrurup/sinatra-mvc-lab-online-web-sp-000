require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/' do
    erb :user_input
  end
  
<<<<<<< HEAD
  post '/piglatinize' do
    puts params[:user_phrase]
    @latinized_phrase = PigLatinizer.new.piglatinize(params[:user_phrase])
    erb :results
=======
  post '/pig_latinize' do
    
>>>>>>> d6785fdcb67d745ef64e80f76aa4fcbbce710588
  end
end