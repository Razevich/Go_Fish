require './Go_fish'
require './Deck'
require './Player'
require './Computer'

deck = Deck.new
player = Player.new('Player_1')
computer_1 = Computer.new('Player_2')
computer_2 = Computer.new('Player_3')
computer_3 = Computer.new('Player_4')
players = [player, computer_1, computer_2,computer_3]
game = Go_Fish.new(deck, player, computer_1, computer_2, computer_3)
round = 1


until game.game_over?
	players.each do |play|

		if play.name == 'Player_1'
			puts "These are your cards"
			play.show_cards
		end
		play.turn(players)
	end

	puts "End of round #{round}"
	sleep(1)
	round += 1

end

game.calculate_winner(players)