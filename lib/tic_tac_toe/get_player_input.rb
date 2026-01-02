# frozen_string_literal: true

module TicTacToe
  # invoked for each player's turn. Player selects
  # which board position in which to place the next
  # token.
  class PlayerInput
    def self.call(board, player_name)
      new.call(board, player_name)
    end

    def call(board, player_name)
      val = -1
      valid_nums = /[0-8]/

      loop do
        print "#{player_name}: "
        val = $stdin.gets.chomp
        if valid_nums.match?(val)
          break unless board.get_ttt_token_disp_name(val.to_i) != ' '

          puts 'This cell is occupied, try another.'

        else
          puts 'Invalid selection, try a number from 0 - 8.'
        end
      end

      val.to_i
    end
  end
end
