# frozen_string_literal: true

# I consist of positions which may be occupied by game tokens.

module TicTacToe
  # In general games like these have something like a game board.
  # The board here represents a tic tac toe "ttt" board.
  class Board
    NUMBER_OF_POSITIONS = 9

    attr_accessor :ttt_board

    # class method
    def self.add_ttt_board
      new.call
    end

    def initialize
      @ttt_board = Array.new(NUMBER_OF_POSITIONS)
    end

    def call
      TicTacToe::SetupNewTicTacToeBoard.call(self)
      self
    end

    def get_ttt_token_disp_name(board_pos)
      # position_location is a number 0 - 8
      this_token = @ttt_board[board_pos].player_token
      return ' ' if this_token.nil?

      this_token.token_disp_name
    end
  end
end
