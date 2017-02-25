defmodule Poker.AuthController  do
	use Poker.Web, :controller
    plug Ueberauth

    def callback(conn, params) do
    	IO.puts"------------"
    	IO.inspect(conn.assigns)
    	IO.puts"-----------------"
    	IO.inspect(params)
    	IO.inspect"-------------"
    end	
end
