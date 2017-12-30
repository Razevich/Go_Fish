require_relative '../Player'
require_relative '../Go_fish'
require_relative '../Deck'
require_relative '../Computer'

describe Player do

	before do
		@player = Player.new('player_1')
		@comp = Player.new('playe_2')
		@deck = Deck.new
		@computer_1 = Computer.new('Player_2')
		@computer_2 = Computer.new('Player_3')
		@computer_3 = Computer.new('Player_4')
		@players = [@player, @computer_1, @computer_2, @computer_3]
		@go_fish = Go_Fish.new(@deck, @player,@computer_1, @computer_2, @computer_3)
	end

	#Deck test
	
	describe "cards" do
		context "When we initialize a deck it needs 13 types of cards" do
			it "generates 13 size hash on start" do
				@de = Deck.new
				expect(@de.cards.length).to eq(13)
			end
		end
	end

	#player test
	describe "cards" do
		context "player should have cards generated at start" do
			it "generates a hand for player" do
				expect(@player.cards).to_not eq({})
			end
		end
	end

	describe "add_card" do
		context "player needs to add cards to their hand when they guess wrong " do
			it "lets a player add a card" do
				first = @player.cards.size
				@player.add_card('P')
				second = @player.cards.size
				expect(first).to_not eq(second)
			end
		end
	end

	describe 'remove card from hand' do
		context 'removes a card from a players hand' do
			it 'removes card from hand of player if they have it' do
				play = @player
				play.add_card('W')
				expect(play.has_card?('W')).to eq(true)
				play.remove_set_from_hand('W')
				expect(play.has_card?('W')).to eq(false)

			end
		end
	end

	describe "has_card" do
		context "checks if a player has certain card" do
			it "checks if player has a card so it can be given" do
				play = @player
				play.add_card('K')
				expect(play.has_card?('K')).to eq(true)
			end
		end
	end

	describe 'check_if_complete' do
		context 'checks if a player has all 4 cards of a type' do
			it 'checks if a player has all 4 cards of a type and then adds them to that players set' do
				plays = Player.new('player_1')
				
				4.times do
					plays.add_card(1)
				end
				expect(plays.complete_sets.length).to eq(1)
			end
		end
	end


	#Go_fish test

	describe "go_fish" do
		context "check to see if a player adds a card when guess is wrong" do
			it "adds a card to players hand" do
				player_1 = @player
				cards = player_1.cards.size
				@go_fish.go_fish(player_1)
				cards_2 = player_1.cards.size
				
				expect(cards).to eq(cards_2 - 1)
			end
		end
	end

	describe "calculate winner" do
		context "check to see if calculate winner is correct logic" do
			it "correctly generates a winner" do
				@player.complete_sets = ['A', 'K', 'Q']
				@computer_1.complete_sets = ['J']
				@computer_3.complete_sets = ['10', '9']
				@computer_2.complete_sets = ['8']

				expect(@go_fish.calculate_winner(@players)).to eq('player_1 wins! with a set count of 3')
			end
		end
	end

	describe "player_has_cards" do
		context "check to see if player has no cards" do
			it "gives player cards if they have none" do
				@player.cards = {}
				expect(@player.has_cards?).to eq(false)

				@go_fish.player_out_of_cards(@player)
				expect(@player.cards.count).to eq(5)

			end
		end
	end


end