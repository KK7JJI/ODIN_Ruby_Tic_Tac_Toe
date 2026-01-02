# frozen_string_literal: true

module TicTacToe
  # match end messages displayed during gameplay.
  module MatchEndMessages
    def display_matchset_summary(game)
      display_matchset_summary_heading
      display_player_wins(game)
      display_game_winner(game)
    end

    def display_matchset_summary_heading
      puts ''
      puts '====================================='
      puts 'GAME OVER, Set Summary'
      puts '====================================='
    end

    def display_player_wins(game)
      game.players.each do |player|
        puts "#{player.player_name}: #{player.player_wins} wins."
      end
    end

    def display_game_winner(game)
      puts '====================================='
      msg = game_winner_msg(game)
      puts msg
      puts ''
    end

    def game_winner_msg(game)
      draw = game.players.each_cons(2).all? do |left, right|
        left.player_wins == right.player_wins
      end
      return 'TIE GAME!' if draw

      winner = game.players.reduce do |winner, player|
        winner = player if player.player_wins > winner.player_wins
        winner
      end
      "#{winner.player_name} wins."
    end
  end
end
