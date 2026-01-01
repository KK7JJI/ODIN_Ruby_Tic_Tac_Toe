# execute the game from here.  Player will supply the desired number of
# matches to be played as a parameter in run.sh.
#
# lib/my_project.rb

require_relative "tic_tac_toe/display_game"
require_relative "tic_tac_toe/ttt_help"
require_relative "tic_tac_toe/setup_new_game"
require_relative "tic_tac_toe/play_match_set"
require_relative "tic_tac_toe/get_player_input"
require_relative "tic_tac_toe/play_match"
require_relative "tic_tac_toe/game"
require_relative "tic_tac_toe/board"
require_relative "tic_tac_toe/position"
require_relative "tic_tac_toe/setup_new_tictactoe_board"
require_relative "tic_tac_toe/player"
require_relative "tic_tac_toe/place_new_token"
require_relative "tic_tac_toe/match"
require_relative "tic_tac_toe/update_match_status"
require_relative "tic_tac_toe/app"
require_relative "tic_tac_toe/player_token"
require_relative "tic_tac_toe/version"

module TicTacToe
  # the class method
  def self.run(args)
    puts "File: #{__FILE__.split("/")[-1]}, Running method: #{__method__}"
    app = TicTacToe::App.new
    app.run(args)

  end

end

# Start the program if this file is executed directly
TicTacToe.run(ARGV)