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
      board_tokens = game_board.rows
      mizzen_row(board_tokens[0])
      center_row
      mizzen_row(board_tokens[1])
      center_row
      mizzen_row(board_tokens[2])
      bottom_row
    end

    def print_board_positions
      top_row
      mizzen_row(%w[0 1 2])
      center_row
      mizzen_row(%w[3 4 5])
      center_row
      mizzen_row(%w[6 7 8])
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

    def mizzen_row(board_tokens)
      mizzen_row = []
      board_tokens.each do |token|
        mizzen_row.push(LIGHT_BOX_CHARS[:vertical])
        mizzen_row.push(token)
      end
      mizzen_row.push(LIGHT_BOX_CHARS[:vertical])
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
