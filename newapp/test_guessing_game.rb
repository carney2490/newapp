require 'minitest/autorun'
require_relative 'guessing_game.rb'

class TestGuessingGame < Minitest::Test 
	

	def test_create_new_game_fixed_number
		number = 10
		game = Game.new(number)
		assert_equal(10, game.number)
	end

	def test_create_new_game_random_number
		100.times do
			number = rand(100) + 1
			game = Game.new(number)
			assert_equal(true, game.number <= 100)
			assert_equal(true, game.number >= 1)
		end
	end

	def test_number_guesses_0_at_start
		game = Game.new(10)
		assert_equal(0, game.guesses)
	end

	def test_update_guesses_made
		game = Game.new(10)
		game.update_guesses
		assert_equal(1, game.guesses)
	end

	def test_game_lost_after_5_guesses
		game = Game.new(10)
		game.guesses = 5
		assert_equal(true, game.lost?)
	end

	def test_game__not_lost_after_2_guesses
		game = Game.new(10)
		game.guesses = 2
		assert_equal(false, game.lost?)
	end

	def test_gane_won
		game = Game.new(10)
		assert_equal(true, game.correct_guess?(10))
	end

end