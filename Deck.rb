class Deck

	attr_accessor :deck_of_cards
	
	def initialize
		@deck_of_cards = cards
	end

	def cards
		deck = {'2' => 4,
				'3' => 4,
				'4' => 4,
				'5' => 4,
				'6' => 4,
				'7' => 4,
				'8' => 4,
				'9' => 4,
				'10' =>4,
				'J'  =>4,
				'Q'  =>4,
				'K'  =>4,
				'A'  =>4}

		return deck
	end


end