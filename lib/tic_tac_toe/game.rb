# frozen_string_literal: true

module TicTacToe
  # Holds the various elements of a tic tac toe game,
  # players, boards, matches, etc.
  class Game
    include TicTacToe::TTTHelp

    attr_reader :players
    attr_accessor :matches, :number_of_matches

    def self.new_game(match_count = 1)
      new(match_count).call
    end

    def initialize(match_count)
      @number_of_matches = match_count
      @players = []
      @matches = []
    end

    def call
      self
    end

    def current_match
      matches[-1]
    end

    def display_game_opening_msg
      display
      puts ''
      puts '------------------------------'
      puts 'Starting New Game, Tic Tac Toe'
      puts '------------------------------'
      player1 = players[0].player_name
      player2 = players[1].player_name
      player1 = 'Computer' if players[0].computer_player
      player2 = 'Computer' if players[1].computer_player
      puts "#{player1} vs. #{player2}"
      puts ''
      display_match_help_message
    end

    def display_player_stats
      puts 'Player scores as follows:'
      puts '==========================='
      players.each do |player|
        puts "#{player.player_name}: #{player.player_wins} wins."
      end
      puts ''
    end
  end
end
