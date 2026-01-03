# frozen_string_literal: true

module TicTacToe
  # A set consists of N matches to be played by 2 players.
  # at the end of a set we'll ID a winner and print a match
  # by match summary.
  class PlayMatchSet
    include TicTacToe::TTTHelp
    include TicTacToe::MatchEndMessages
    include TicTacToe::SetEndMessages

    def self.call(game)
      new.call(game)
    end

    def initialize
      @matches_played = 0
    end

    def call(game)
      while game.matches.length < game.number_of_matches
        cur_match = add_new_match(game)
        TicTacToe::PlayMatch.call(game, cur_match)
        display_player_stats(game.players)

      end

      display_matchset_summary(game)
      list_match_wins(game)
    end

    def add_new_match(game)
      puts game.matches.length + 1
      game.matches.push(TicTacToe::Match.new_match(game.matches.length + 1))
      game.current_match.board = TicTacToe::Board.add_ttt_board
      game.current_match
    end
  end
end
