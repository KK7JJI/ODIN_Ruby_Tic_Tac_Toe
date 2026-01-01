module TicTacToe
  class PlayerInput

    def self.call(board, player_name)
      new().call(board, player_name)
    end

    def call(board, player_name)

      val = -1
      valid_nums = /[0-8]/

      while true do
        print "#{player_name}: "
        val = STDIN.gets.chomp
        if valid_nums.match?(val)
          if board.get_TTT_token_disp_name(val.to_i) != " "
            puts "This cell is occupied, try another."
          else
            break
          end
        else
          puts "Invalid selection, try a number from 0 - 8."
        end

      end

      return val.to_i
    end

  end
end