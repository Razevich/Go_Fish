require './Player'
require './Deck'


class Go_Fish
	#create accesor for deck and all the players
	attr_accessor :deck, :players, :card
	
	#start the game with a deck and all the players
	def initialize(deck, player_1, player_2, player_3, player_4)
		@deck = deck.cards
		@players= [player_1, player_2, player_3, player_4]
		assign_cards_to_players
	end

	#this is only for the start
	#this is probably a horrible way to code this, refactor at later date for speed
	def assign_cards_to_players
		5.times do 
			@players.each do |player|
				player.add_card(random_card)
			end
		end
	end

	#grabs a random card from the deck
	#calls remove card method and then returns card
	def random_card
		card = @deck.keys.sample
		remove_card_from_deck(card)
		
		return card
	end

	def remove_card_from_deck(card)
		deck[card] = deck[card] - 1
		if @deck[card] == 0
			@deck.delete(card)
		end
	end

	def game_over?
		@deck.size == 0
	end

	def go_fish(player)
		player.add_card(random_card)
	end

	def calculate_winner(players)
		lead_player = ''
		lead_player_size = 0

		players.each do |player|
			if player.complete_sets.length > lead_player_size
				lead_player = player
				lead_player_size = player.complete_sets.length
			end
		end
		return "#{lead_player.name} wins! with a set count of #{lead_player_size}"
	end

end

