module TicTacToe
  module TTTHelp
    include TicTacToe::DisplayGame

    def display_match_help_message()
      puts "---------------------------------------------"
      puts "The tic tac toe board cells are numbered from"
      puts "0 - 8 starting at the top left, ending in the"
      puts "bottom right ordered left to right and top to"
      puts "bottom."
      puts ""
      puts "Select a cell by entering a number 0 - 8."
      puts "---------------------------------------------"
      puts ""
    end

    def display_sample_TTT_board()
      puts "Tic Tac Toe board positions:"
      puts "Select one: (0-8)"
      print_board_positions()
    end

    def display_current_board(board)
      print_board(board)
    end

    def display_setup_help_message()
      puts "---------------------------------------------"
      puts "Player Setup:"
      puts " Enter a name for each human player"
      puts " Leave the name field blank for computer players"
      puts ""
      puts " Player token names will default to X and O"
      puts " unless a alternative value is entered."
      puts " Tokens may only be 1 character in length."
      puts ""
      puts " A match may consist of 1 to N"
      puts " individual tic tac toe games"
      puts " enter a number to set the match."
      puts "---------------------------------------------"
      puts ""
    end
  end
end