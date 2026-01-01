# A set is a collection of matches played.  A player wins by winning a
# simple majority of matches in a match (not including draws).
# player 1: 1
# player 2: 0
#     draw: 4
#
# player 1 wins.
module TicTacToe
  class PlayMatchSet

    def self.call(game)
      new().call(game)
    end

    def initialize()
      @matches_played = 0
    end

    def call(game)

      while game.matches.length < game.number_of_matches do

        game.matches.push(TicTacToe::Match.new_match())
        game.get_current_match().board = TicTacToe::Board.add_TTT_board()
        cur_match = game.get_current_match()
        TicTacToe::PlayMatch.call(game, cur_match)
        game.display_player_stats()

      end

      display_matchset_summary(game)
      list_match_wins(game)
    end

    def display_matchset_summary(game)
      puts ""
      puts "====================================="
      puts "GAME OVER, Set Summary"
      puts "====================================="
      game.players.each do |player|
        puts "#{player.player_name}: #{player.player_wins} wins."
      end

      draw = game.players.each_cons(2).all? do |left, right|
        left.player_wins == right.player_wins
      end

      puts "====================================="
      if draw
        msg = "TIE GAME!"
      else
        winner = game.players.reduce() do |winner, player|
          winner = player if player.player_wins > winner.player_wins
          winner
        end
        msg = "#{winner.player_name} wins."
      end

      puts msg
      puts ""

    end

    def list_match_wins(game)
      puts "Match Summary:"
      puts "====================================="

      played_matches = []
      game.matches.each do |match|
        if match.winner == nil
          player_name = "Tie Game"
        else
          player_name = match.winner.player_name
        end
        played_matches.push([match.match_counter, player_name])
      end

      played_matches.each do |match|
        puts "Match number: #{match[0]} => #{match[1]}"
      end
      puts "====================================="
      puts ""
    end

  end
end