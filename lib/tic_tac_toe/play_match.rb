module TicTacToe
  class PlayMatch
    include TicTacToe::DisplayGame

    def self.call(game, cur_match)
      new().call(game, cur_match)
    end

    def call(game, cur_match)

      cur_match.display_match_start_message()
      while true
        cur_match.increment_round_counter()
        puts ""
        puts "Round #{cur_match.match_round_counter}"
        puts ""
        game.players.each do |player|
          cur_match.increment_turn_counter()
          TicTacToe::PlayerToken.add_token(player)

          if player.player_is_computer?()
            cur_pos = get_random_position(cur_match)
          else
            val = TicTacToe::PlayerInput.call(cur_match.board, player.player_name)
            cur_pos = cur_match.board.TTT_board[val]
          end

          TicTacToe::PlaceNewToken.call(player, cur_pos)
          print_board(cur_match.board)
          TicTacToe::UpdateMatchStatus.call(cur_match, cur_pos, player)
          break if cur_match.match_ended?()
        end
        break if cur_match.match_ended?()
      end
      cur_match.display_match_end_message()
    end

    def get_random_position(cur_match)
      return (cur_match.board.TTT_board.filter do |pos|
        true if pos.player_token == nil
      end).sample
    end


  end
end