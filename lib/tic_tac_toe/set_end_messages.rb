# frozen_string_literal: true

module TicTacToe
  # messages displayed after a set of matches have
  # been played detailing individual match outcomes.
  module SetEndMessages
    def list_match_wins(game)
      display_set_wins_header
      list_of_match_wins(game.matches).each do |match|
        puts "Match number: #{match[0]} => #{match[1]}"
      end
      display_set_wins_footer
    end

    def display_set_wins_header
      puts 'Match Summary:'
      puts '====================================='
    end

    def list_of_match_wins(matches)
      played_matches = []
      matches.each do |match|
        player_name = if match.winner.nil?
                        'Tie Game'
                      else
                        match.winner.player_name
                      end
        played_matches.push([match.match_counter, player_name])
      end
      played_matches
    end

    def display_set_wins_footer
      puts '====================================='
      puts ''
    end
  end
end
