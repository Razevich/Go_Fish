class Player

	attr_accessor :cards, :complete_sets, :name

	def initialize(cards = {}, complete_sets = [], name)
		@name = name
		@cards = cards
		@complete_sets = complete_sets
	end

	#check if we have a full set of cards, if we do add them to our collection
	def check_if_complete(card)	
		if @cards.has_value?(4)
			completed_card = card
			@complete_sets.push(completed_card)
			remove_set_from_hard(completed_card)
		end

	end

	def show_cards
		puts @cards
	end

	#Used for clearing a set of cards from player hand when all 4 cards 
	#are gathered by one player
	#or if a card is selected by another player during their turn
	def remove_set_from_hard(card)
		@cards.delete(card)
	end


	def add_card(card)
		if has_card?(card)
			@cards[card] = @cards[card] + 1
		else	
			@cards[card] = 1
		end

		check_if_complete(card)
	end

	def has_card?(card)
		@cards.has_key?(card)
	end

	#used to give card from second player to first player 
	#if first player correctly guesses once of second players cards
	def give_card_to_player(card,player)
		#player is another player object
		@cards[card].times do
			player.add_card(card)
		end


		#remove cards from hand if selected by another player
		self.remove_set_from_hand(card)
	end

	def valid_choice?(choice)
		@cards.has_key?(choice)
	end

	def valid_player?(players, player)
		players.each do |play|
			if play.name == player && player != self.name
				return true
			end
		end
		return false
	end

	def turn(players)
		#This is only here because players_choice needs to live outside the loop in where it is set down below
		players_choice = ''

		puts "#{@name} Please select a card "
		card = gets.chomp

		until valid_choice?(card)
			puts "That was not a valid choice, please select a card currently in your hand"
			sleep(1)
			puts "Plase select a card"
			card = gets.chomp
		end

		puts "Now select a player"
		player = gets.chomp

		until valid_player?(players, player)
			puts "That was not a valid choice, please select a player in the game"
			sleep(1)
			puts "please select a player"
			player = gets.chomp
		end

		players.each do |play|
			if player == play.name
				players_choice = play
			end
		end


		puts "you selected #{card} from #{players_choice.name}"

		return

		if players_choice.has_card?(card)
			puts "#{players_choice} has a #{card}! Now you have it!"
			players_choice.give_card_to_player(card, self)
		else
			puts " Go fish"
			self.add_card(random_card)
		end


	end

end