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

	def player_out_of_cards(player)
		card_count = @deck.values.inject(0){|a,b| a+b }

		if card_count >= 5
			5.times do
				player.add_card(random_card)
			end
		else
			card_count.times do
				player.add_card(random_card)
			end
		end
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

	def calculate_results(players)
		results = Array.new(4,[])
		players.each_with_index do |player, index|
			results[index] = [player.complete_sets.length, player.name]
		end

		results = results.sort

		puts "In first place we have #{results[3][1]} with a total of #{results[3][0]}"
		sleep(1)
		puts "In second place we have #{results[2][1]} with a total of #{results[2][0]}"
		sleep(1)
		puts "In third place we have #{results[1][1]} with a total of #{results[1][0]}"
		sleep(1)
		puts "In last place we have #{results[0][1]} with a total of #{results[0][0]}"
		sleep(1)

		puts "Congradulations to our winner and better luck next time to the rest!"
	end

end

