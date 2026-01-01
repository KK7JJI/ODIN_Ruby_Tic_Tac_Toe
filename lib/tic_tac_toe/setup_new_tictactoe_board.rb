module TicTacToe
  class SetupNewTicTacToeBoard

    def self.call(new_board)
      new().call(new_board)
    end

    def call(new_board)
      new_board.TTT_board = new_board.TTT_board.map.with_index \
      do
        |pos, i|
        pos = TicTacToe::Position.call(i)
      end
    end
  end
end