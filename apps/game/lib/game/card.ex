defmodule Card do
@moduledoc """
methode pour creer un jeu de carte.
"""
@doc """
retourner une liste de cartes
"""


	def create_deck do
		values=["Ace", "Jack", "Quenn", "King", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
		suits=["Spades", "Clubs", "Hearts", "Diamond"]

		for suit <-suits, value <- values do
		"#{value} of #{suit}"
    	end
		
	end

	 def create_multiple_deck(qte) do
	 	Card.add_joker
	 	|> List.duplicate(qte)
	 	|> List.flatten

     end 
    def add_joker do
    	deck=Card.create_deck
    	joker=["red_joker", "black_joker"]
    	List.flatten(deck, joker)

    end  

	def shuffle(deck) do
		Enum.shuffle(deck)
	end


	def contains?(deck, card) do
		Enum.member?(deck, card)
	end	
	
	@doc """
	divise un jeu de carte en main la 'main' indique combien de cartes jouer
	"""
	def deal(deck, hand_size) do
		Enum.split(deck, hand_size)
	end



	def players(x) do
     List.duplicate("players", x)
     |> Enum.with_index(1)
	end	


	def save(deck, filename) do
		binary = :erlang.term_to_binary(deck)
		File.write(filename, binary)
	end

	def load (filename) do

		case File.read(filename) do
		{:ok, binary} ->:erlang.binary_to_term binary
		{:error, _reason}->"sa existe pas nono"
		end	  
	end

	def create_hand(hand_size, qte) do
		Card.create_multiple_deck(qte)
		|>Cards.shuffle
		|>Cards.deal(hand_size)	
	end	


	def give_cards(qte,players) do
		deck = Card.create_deck
 		newDeck = Card.shuffle(deck)
		List.duplicate(qte,players)
		 |> Enum.with_index(1)
           
	end

	def create_multiplayer_game(player_amount) do
		deck = Card.create_deck
			|> Card.shuffle
            |> Enum.take(player_amount * 5) 
            |> Enum.chunk(5)
		

	end


	def deal_multiplayer_hand(deck, hand_size, player_amount) do 
		Card.deal(deck, hand_size, player_amount)
          |> Card.shuffle
		end
end


	
#voici ce quil faut reg
		#Retourne et change cartes (hint function devrait prendre le joueur, les carte a change etc)
		# Bet
		# Fold/passer
		# a qui le tour
		#
 
