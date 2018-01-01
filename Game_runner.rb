require './Go_fish'
require './Deck'
require './Player'
require './Computer'

@deck = Deck.new
player = Player.new('Player_1')
computer_1 = Computer.new('Player_2')
computer_2 = Computer.new('Player_3')
computer_3 = Computer.new('Player_4')
players = [player, computer_1, computer_2,computer_3]
game = Go_Fish.new(@deck, player, computer_1, computer_2, computer_3)
round = 1


until game.game_over?
	players.each do |player|

		next if !player.has_cards? && game.deck.size == 0

		if !player.has_cards?
			game.player_out_of_cards(player)
		end

		if player.name == 'Player_1'
			puts "These are your cards"
			player.show_cards
		end

		player.turn(players, game.deck)
	end

	puts "End of round #{round}"
	sleep(1)
	round += 1

end

game.calculate_results