# frozen_string_literal: true

module TicTacToe
  # routines here are used to provide a graphical representation
  # of the current game in a terminal.
  module DisplayGame
    LIGHT_BOX_CHARS = {
      horizontal: "\u2500",
      vertical: "\u2502",
      vertical_left: "\u2524",
      vertical_right: "\u251C",
      horizontal_up: "\u2534",
      horizontal_down: "\u252C",
      down_left: "\u2510",
      down_right: "\u250C",
      up_left: "\u2518",
      up_right: "\u2514",
      cross: "\u253C"
    }.freeze

    def print_board(game_board)
      top_row
      row_data = [
        game_board.get_ttt_token_disp_name(0),
        game_board.get_ttt_token_disp_name(1),
        game_board.get_ttt_token_disp_name(2)
      ]
      mizzen_row(row_data[0], row_data[1], row_data[2])
      center_row
      row_data = [
        game_board.get_ttt_token_disp_name(3),
        game_board.get_ttt_token_disp_name(4),
        game_board.get_ttt_token_disp_name(5)
      ]
      mizzen_row(row_data[0], row_data[1], row_data[2])
      center_row
      row_data = [
        game_board.get_ttt_token_disp_name(6),
        game_board.get_ttt_token_disp_name(7),
        game_board.get_ttt_token_disp_name(8)
      ]
      mizzen_row(row_data[0], row_data[1], row_data[2])
      bottom_row
    end

    def print_board_positions
      top_row
      mizzen_row('0', '1', '2')
      center_row
      mizzen_row('3', '4', '5')
      center_row
      mizzen_row('6', '7', '8')
      bottom_row
    end

    def top_row
      top_row = [
        LIGHT_BOX_CHARS[:down_right],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:horizontal_down],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:horizontal_down],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:down_left]
      ]
      puts top_row.join
    end

    def mizzen_row(pos1, pos2, pos3)
      mizzen_row = [
        LIGHT_BOX_CHARS[:vertical],
        pos1.to_s,
        LIGHT_BOX_CHARS[:vertical],
        pos2.to_s,
        LIGHT_BOX_CHARS[:vertical],
        pos3.to_s,
        LIGHT_BOX_CHARS[:vertical]
      ]
      puts mizzen_row.join
    end

    def center_row
      center_row = [
        LIGHT_BOX_CHARS[:vertical_right],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:cross],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:cross],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:vertical_left]
      ]
      puts center_row.join
    end

    def bottom_row
      bottom_row = [
        LIGHT_BOX_CHARS[:up_right],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:horizontal_up],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:horizontal_up],
        LIGHT_BOX_CHARS[:horizontal],
        LIGHT_BOX_CHARS[:up_left]
      ]
      puts bottom_row.join
    end
  end
end
