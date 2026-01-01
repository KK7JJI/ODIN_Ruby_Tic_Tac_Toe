# the game will consist of players
# set object - you could have multiple sets . . .
#

# a game includes
#  players
#    tokens
#  game board
#    tokens
#

module TicTacToe
  class Game
    include TicTacToe::TTTHelp

    attr_reader :players
    attr_accessor :matches, :number_of_matches

    @@game_counter = 0

    def self.new_game(match_count=1)
      @@game_counter += 1
      new(match_count).call()

    end

    def initialize(match_count)
      @number_of_matches = match_count + 1
      @players = []
      @matches = []

    end

    def call()
      return self
    end

    def get_current_match()
      return matches[-1]
    end

    def display_game_opening_msg()
      display
      puts ""
      puts "------------------------------"
      puts "Starting New Game, Tic Tac Toe"
      puts "------------------------------"
      player1 = players[0].player_name
      player2 = players[1].player_name
      player1 = "Computer" if players[0].computer_player
      player2 = "Computer" if players[1].computer_player
      puts "#{player1} vs. #{player2}"
      puts ""
      display_match_help_message()
    end

    def display_player_stats()
      puts "Player scores as follows:"
      puts "==========================="
      self.players.each do |player|
        puts "#{player.player_name}: #{player.player_wins} wins."
      end
      puts ""
    end

  end
end