defmodule Player do
	defstruct [
    type: nil,
    player: nil,
    amount: nil
  ]
	def player(id) do
     List.duplicate("player","id")
     |> Enum.with_index(1)
	end	


  def create_multiplayer_game(player_amount) do
    deck = Card.create_deck
      |> Card.shuffle
            |> Enum.take(player_amount * 5) 
            |> Enum.chunk(5)
  end  

def deal_multiplayer_hand(deck, hand_size, player_amount) do 
    Card.deal(deck, hand_size)      
  end

  

  def call(player_id, amount: amount) do
    %Player{
      type: :call,
      player: player_id,
      amount: amount
    }
  end

  def bet(player_id, amount: amount) do
    %Player{
      type: :bet,
      player: player_id,
      amount: amount
    }
  end

  def raise(player_id, amount: amount) do
    %Player{
      type: :raise,
      player: player_id,
      amount: amount
    }
  end

  def check(player_id) do
    %Player{
      type: :check,
      player: player_id,
    }
  end

  def fold(player_id) do
    %Player{
      type: :fold,
      player: player_id,
    }
  end
end
 

     
