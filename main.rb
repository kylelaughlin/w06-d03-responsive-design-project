require "pry"
require "sinatra"

# Your routes go here:

get '/' do
  erb :home
end

get '/temp-converter' do
  erb :temp_converter_form
end

get '/temp-converter-results' do
  @temperature = params['temperature'].to_i
  @units = params['units']

  if @units == "f"
    @result = (@temperature - 32) * 5 / 9
    @ending_unit = "C"
  elsif @units == "c"
    @result = @temperature * 9 / 5 + 32
    @ending_unit = "F"
  else
    @result = 0
    @ending_unit = "Nothing"
  end

  erb :temp_converter_results
end

get '/reverser' do
  erb :reverser_form
end

get '/word-reverser-result' do
  @phrase = params[:phrase] || "You gotta enter a phrase"
  @phrase = @phrase.reverse
  erb :reverser_result
end
