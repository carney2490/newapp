class Game

	attr_reader :number
	attr_accessor :guesses

	def initialize(number)
		@number = number
		@guesses = 0
	end

	def update_guesses()
		@guesses += 1
	end

	def lost?
		@guesses >= 5
	end

	def correct_guess?(guess)
		guess == number
	end
end