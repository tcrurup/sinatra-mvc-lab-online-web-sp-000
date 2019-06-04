ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  x = PigLatinizer.new("I'm not clumsy, The floor just hates me, the table and chairs are bullies and the walls get in my way.")
  y = WordAnalyzer.new("string")
  binding.pry
end