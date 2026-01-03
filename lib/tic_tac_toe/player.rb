# frozen_string_literal: true

module TicTacToe
  # each player has tokens assigned to positions on the
  # game board.  Player may be human or computer.
  class Player
    attr_accessor :player_tokens, :player_wins
    attr_reader :player_name, :default_token_name, :computer_player

    def self.add_player(player_name, default_token_name,
                        computer_player: false)
      new(player_name, default_token_name, computer_player).call
    end

    def initialize(player_name, default_token_name, computer_player)
      @player_tokens = []
      @default_token_name = default_token_name
      @computer_player = computer_player
      @player_name = player_name
      @player_wins = 0
    end

    def add_match_win
      self.player_wins += 1
    end

    def player_is_computer?
      @computer_player
    end

    def call
      self
    end
  end
end
