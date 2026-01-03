# frozen_string_literal: true

module TicTacToe
  # invoked for each player's turn. Player selects
  # which board position in which to place the next
  # token.
  class PlayerInput
    INPUT_VALIDATION_HANDLER = {
      valid_input: lambda do
        true
      end,

      cell_occupied: lambda do
        puts 'This cell is occupied, try another.'
        false
      end,
      invalid_input: lambda do
        puts 'Invalid selection, try a number from 0 - 8.'
        false
      end
    }.freeze

    def self.call(board, player_name)
      new.call(board, player_name)
    end

    def call(board, player_name)
      loop do
        print "#{player_name}: "
        val = $stdin.gets.chomp
        break if valid_input?(board, val)
      end
      val.to_i
    end

    def valid_input?(board, val)
      INPUT_VALIDATION_HANDLER[validate_input(board, val)].call
    end

    def validate_input(board, val)
      valid_nums = /[0-8]/

      if valid_nums.match?(val)
        return :cell_occupied if board.get_ttt_token_disp_name(val.to_i) != ' '

        :valid_input
      else
        :invalid_input
      end
    end
  end
end
