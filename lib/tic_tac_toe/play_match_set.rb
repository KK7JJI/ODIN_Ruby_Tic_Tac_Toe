# frozen_string_literal: true

module TicTacToe
  # A set consists of N matches to be played by 2 players.
  # at the end of a set we'll ID a winner and print a match
  # by match summary.
  class PlayMatchSet
    include TicTacToe::TTTHelp
    include TicTacToe::MatchEndMessages

    def self.call(game)
      new.call(game)
    end

    def initialize
      @matches_played = 0
    end

    def call(game)
      while game.matches.length < game.number_of_matches

        game.matches.push(TicTacToe::Match.new_match)
        game.current_match.board = TicTacToe::Board.add_ttt_board
        cur_match = game.current_match
        TicTacToe::PlayMatch.call(game, cur_match)
        game.display_player_stats

      end

      display_matchset_summary(game)
      list_match_wins(game)
    end

    def list_match_wins(game)
      puts 'Match Summary:'
      puts '====================================='

      played_matches = []
      game.matches.each do |match|
        player_name = if match.winner.nil?
                        'Tie Game'
                      else
                        match.winner.player_name
                      end
        played_matches.push([match.match_counter, player_name])
      end

      played_matches.each do |match|
        puts "Match number: #{match[0]} => #{match[1]}"
      end
      puts '====================================='
      puts ''
    end
  end
end
