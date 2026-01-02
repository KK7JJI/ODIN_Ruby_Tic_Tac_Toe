# frozen_string_literal: true

# lib/my_project/app.rb
module TicTacToe
  # entry point for the Bash script executable.
  class App
    def run(args)
      # puts "::App.run Running with arguments: #{args.inspect}"

      arg = if args.empty?
              '--showoptions'
            else
              args[0]
            end

      if arg == '--showoptions'
        game = TicTacToe::Game.new_game
        TicTacToe::SetupNewGame.call(game, arg)
      else
        arg = arg.to_i
        game = TicTacToe::Game.new_game(arg)
        TicTacToe::SetupNewGame.call(game)
      end

      game.display_game_opening_msg
      TicTacToe::PlayMatchSet.call(game)
    end
  end
end
