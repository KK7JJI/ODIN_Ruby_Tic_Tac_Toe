# frozen_string_literal: true

module TicTacToe
  # A match is played by 2 players until 1 gets
  # 3 in a row or the match ends in a draw.
  class PlayMatch
    include TicTacToe::TTTHelp
    include TicTacToe::PlayerPositionSelect

    def self.call(game, cur_match)
      new.call(game, cur_match)
    end

    def call(game, cur_match)
      cur_match.display_match_start_message
      loop do
        cur_match.increment_round_counter
        display_match_header(cur_match)
        playround(cur_match, game.players)
        break if cur_match.match_ended?
      end
      cur_match.display_match_end_message
    end

    def playround(cur_match, players)
      match_status = false
      players.each do |player|
        player_turn(cur_match, player)
        display_current_board(cur_match.board)
        match_status = cur_match.match_ended?
        break if match_status
      end
      match_status
    end

    def player_turn(cur_match, player)
      player_type = get_player_type(player)
      TicTacToe::PlayerToken.add_token(player)
      cur_pos = PLAYER_SELECT_HANDLER[player_type].call(cur_match, player)
      TicTacToe::PlaceNewToken.call(player, cur_pos)
      TicTacToe::UpdateMatchStatus.call(cur_match, cur_pos, player)
    end

    def get_player_type(player)
      return :computer if player.player_is_computer?

      :human
    end

    def display_match_header(cur_match)
      display_current_board(cur_match.board)
      puts ''
      puts "Round #{cur_match.match_round_counter}"
      puts ''
      display_sample_ttt_board
      display_current_board(cur_match.board)
      puts ''
    end
  end
end
