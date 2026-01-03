# frozen_string_literal: true

module TicTacToe
  # Print some help messages for game players.
  module TTTHelp
    include TicTacToe::DisplayGame

    SETUP_HELP_MESSAGE = <<~SETUPHELP
      ---------------------------------------------
      Player Setup:
       Enter a name for each human player
       Leave the name field blank for computer players

       Player token names will default to X and O
       unless a alternative value is entered.
       Tokens may only be 1 character in length.

       A match may consist of 1 to N
       individual tic tac toe games
       enter a number to set the match.
      ---------------------------------------------

    SETUPHELP

    MATCH_HELP_MESSAGE = <<~MATCHHELP
      ---------------------------------------------
      The tic tac toe board cells are numbered from
      0 - 8 starting at the top left, ending in the
      bottom right ordered left to right and top to
      bottom.

      Select a cell by entering a number 0 - 8.
      ---------------------------------------------'

    MATCHHELP

    def display_match_help_message
      puts MATCH_HELP_MESSAGE
    end

    def display_sample_ttt_board
      puts 'Tic Tac Toe board positions:'
      puts 'Select one: (0-8)'
      print_board_positions
    end

    def display_current_board(board)
      print_board(board)
    end

    def display_setup_help_message
      puts SETUP_HELP_MESSAGE
    end
  end
end
