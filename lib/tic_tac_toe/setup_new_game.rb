module TicTacToe
  class SetupNewGame
    def self.call(new_game, arg=nil)
      if arg == "--showoptions"
        new().manualsetup(new_game)
      else
        new().autosetup(new_game)
      end
    end

    def initialize()

      @player1 = {"name" => "Player 1",
                  "computer" => false,
                  "token" => "X"}
      @player2 = {"name" => "Player 2",
                  "computer" => false,
                  "token" => "O"}
      @match_count = 2

    end

    def manualsetup(new_game)
      get_number_of_matches()

      get_player_name(@player1)
      get_token_name(@player1)
      get_player_name(@player2)
      get_token_name(@player2)

      new_game.players.push(TicTacToe::Player.add_player(
        @player1["name"],@player1["token"],@player1["computer"]))
      new_game.players.push(TicTacToe::Player.add_player(
        @player2["name"],@player2["token"],@player2["computer"]))

      new_game.number_of_matches = @match_count
    end

    def get_number_of_matches()
      num = -1
      print "How many matches should we play (number)?: "
      while num < 1 do
        num = STDIN.gets.chomp.to_i
        print "enter a number: " if num < 1
      end
      @match_count = num
    end

    def get_player_name(player)

      print "#{player["name"]} Name (enter = computer):"
      name = STDIN.gets.chomp
      if name.length == 0
        player["computer"] = true
      else
        player["name"] = name
      end

    end

    def get_token_name(player)
      print "#{player["name"]} token name (enter = #{player["token"]}:)"
      token = STDIN.gets.chomp
      if token.length > 0
        player["token"] = token[0].upcase
      end
      if token.length > 1
        puts "Using \'#{token[0].upcase}'\."
      end
    end

    def autosetup(new_game)
      new_game.players.push(TicTacToe::Player.add_player(
        @player1["name"],@player1["token"],@player1["computer"]))
      new_game.players.push(TicTacToe::Player.add_player(
        @player2["name"],@player2["token"],@player2["computer"]))

    end


  end
end