# I consist of positions which may be occupied by game tokens.

module TicTacToe

  class Board
    NUMBER_OF_POSITIONS = 9

    attr_accessor :TTT_board

    #class method
    def self.add_TTT_board()
      new().call()
    end

    def initialize()
      @TTT_board = Array.new(NUMBER_OF_POSITIONS)
    end

    def call()
      TicTacToe::SetupNewTicTacToeBoard.call(self)
      return self
    end

    def get_TTT_token_disp_name(board_pos)
      #position_location is a number 0 - 8
      this_token = @TTT_board[board_pos].player_token
      if this_token == nil
        return " "
      else
        return this_token.get_token_disp_name
      end
    end

  end
end