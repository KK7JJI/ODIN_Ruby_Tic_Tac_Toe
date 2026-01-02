# frozen_string_literal: true

module TicTacToe
  # each tic tac toe match has a board.
  class SetupNewTicTacToeBoard
    def self.call(new_board)
      new.call(new_board)
    end

    def call(new_board)
      new_board.ttt_board = new_board.ttt_board.map.with_index \
      do |_pos, i|
        TicTacToe::Position.call(i)
      end
    end
  end
end
