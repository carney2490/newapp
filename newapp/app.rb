require 'sinatra'
require_relative 'guessing_game'

enable :sessions

get '/'  do
	number = rand(10) + 1 
	session[:game] = Game.new(number)
	erb :get_guess, locals: {guesses: session[:game].guesses}
end

post '/guess' do
	guess = params[:guess].to_i
	session[:game].update_guesses
	if session[:game].correct_guess?(guess)
		"You win!"
	elsif session[:game].lost?
		"You lose"
	else
		erb :get_guess, locals: {guesses: session[:game].guesses}
	end
end