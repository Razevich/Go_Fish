require './Player'

class Computer < Player

	def pick_card
		return @cards.keys.sample
	end

	def pick_player(players)
		player = players.sample
		if(valid_player?(player))
			return player
		else
			pick_player(players)
		end
	end

	def valid_player?(player)
		player.name != self.name
	end

	def turn(players, deck)
		
		players_choice = pick_player(players)
		card = pick_card

		puts "#{self.name} picks #{card} from #{players_choice.name}" 

		if players_choice.has_card?(card)
			players_choice.give_card_to_player(card, self)
		else
			return if deck.size == 0

			puts " Go fish"
			go_fish_card = go_fish(deck)
			self.add_card(go_fish_card)
			
			if(pulled_same_card_as_guess?(go_fish_card, card))
				puts "#{self.name} pulled the same card as their guess! They get to go again"
				sleep(1)
				self.turn(players,deck)
			else
				sleep(1)
			end
		end
	end

end