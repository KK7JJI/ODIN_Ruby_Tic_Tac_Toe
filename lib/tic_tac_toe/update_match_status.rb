module TicTacToe
  class UpdateMatchStatus

    def self.call(cur_match, cur_pos, cur_player)
      new().call(cur_match, cur_pos, cur_player)
    end

    def call(cur_match, cur_pos, cur_player)

      if player_wins_TTT_match?(cur_pos, cur_match)
        cur_match.update_match_status(
          true, "Match ends, #{cur_player.player_name} wins.")
        cur_match.set_winner(cur_player)
        cur_player.add_match_win()
      elsif TTT_board_is_full?(cur_match)
        cur_match.update_match_status(
          true, "Match ends, Tie Game.")
      else
        cur_match.update_match_status(
          false, "Ready for next move.")
      end
    end

    def TTT_board_is_full?(cur_match)
      return false if empty_position_count(cur_match) > 0
      return true
    end

    def player_wins_TTT_match?(cur_pos, cur_match)
      winning_exp = Regexp.new(
        cur_match.board.get_TTT_token_disp_name(cur_pos.pos_id)*3)

      check_directions = ["H","V","RD","LD"]
      check_directions.any? do |dir|
        neighbors = get_line_of_positions(cur_match, cur_pos, dir)
        get_string_rep_of_line(cur_match, neighbors)
        winning_exp.match?(get_string_rep_of_line(cur_match, neighbors))
      end
    end

    private

    def empty_position_count(cur_match)
      token_count = cur_match.board.TTT_board.reduce(0) do |counter, pos|
        counter += 1 if pos.player_token != nil
        counter
      end
      return cur_match.board.TTT_board.length - token_count
    end

    def get_line_of_positions(cur_match, pos, dir, visited=[])
      adj_pos = pos.get_nearest_neighbors(dir).dup
      visited.push pos.pos_id()

      while adj_pos.length > 0
        next_pos = adj_pos.pop()
        if visited.index(next_pos) == nil
          get_line_of_positions(cur_match, cur_match.board.TTT_board[next_pos],
            dir, visited)
        end
      end
      return visited.sort
    end

    def get_string_rep_of_line(cur_match, visited=[])
      string_rep = visited.sort.reduce("") do |string_rep, pos|
        string_rep += cur_match.board.get_TTT_token_disp_name(pos)
      end
      return string_rep
    end

  end

end