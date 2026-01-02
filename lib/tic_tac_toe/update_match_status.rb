# frozen_string_literal: true

module TicTacToe
  # a service class used to determine if the conditions
  # have been met to end the current match.
  # 3 in a row or the board is full of tokens.
  class UpdateMatchStatus
    include TicTacToe::MatchEndHandler

    def self.call(cur_match, cur_pos, cur_player)
      new.call(cur_match, cur_pos, cur_player)
    end

    def call(cur_match, cur_pos, cur_player)
      outcome = determine_match_status(cur_match, cur_pos)
      MATCH_END_HANDLERS[outcome].call(cur_match, cur_player)
    end

    def determine_match_status(cur_match, cur_pos)
      return :win if player_wins_ttt_match?(cur_pos, cur_match)
      return :draw if ttt_board_is_full?(cur_match)

      :continue
    end

    def ttt_board_is_full?(cur_match)
      return false if empty_position_count(cur_match).positive?

      true
    end

    def player_wins_ttt_match?(cur_pos, cur_match)
      winning_exp = Regexp.new(
        cur_match.board.get_ttt_token_disp_name(cur_pos.pos_id) * 3
      )

      check_directions = %w[H V RD LD]
      check_directions.any? do |dir|
        neighbors = get_line_of_positions(cur_match, cur_pos, dir)
        get_string_rep_of_line(cur_match, neighbors)
        winning_exp.match?(get_string_rep_of_line(cur_match, neighbors))
      end
    end

    private

    def empty_position_count(cur_match)
      token_count = cur_match.board.ttt_board.reduce(0) do |counter, pos|
        counter += 1 unless pos.player_token.nil?
        counter
      end
      cur_match.board.ttt_board.length - token_count
    end

    def get_line_of_positions(cur_match, pos, dir, visited = [])
      adj_pos = pos.get_nearest_neighbors(dir).dup
      visited.push pos.pos_id

      while adj_pos.length.positive?
        next_pos = adj_pos.pop
        if visited.index(next_pos).nil?
          get_line_of_positions(cur_match, cur_match.board.ttt_board[next_pos],
                                dir, visited)
        end
      end
      visited.sort
    end

    def get_string_rep_of_line(cur_match, visited = [])
      visited.sort.reduce('') do |string_rep, pos|
        string_rep + cur_match.board.get_ttt_token_disp_name(pos)
      end
    end
  end
end
