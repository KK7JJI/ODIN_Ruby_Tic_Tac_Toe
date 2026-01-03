# frozen_string_literal: true

# lib/my_project/app.rb
module TicTacToe
  # entry point for the Bash script executable.
  class App
    STARTUP_OPTION_HANDLER = {
      manual_setup: lambda do |game, _|
        TicTacToe::SetupNewGame.call(game, '--manual_setup')
      end,
      automated_setup: lambda do |game, arg|
        game.number_of_matches = arg.to_i
        TicTacToe::SetupNewGame.call(game, '--automated_setup')
      end
    }.freeze

    def run(args)
      # puts "::App.run Running with arguments: #{args.inspect}"

      arg = if args.empty?
              '--manual_setup'
            else
              args[0]
            end

      game = TicTacToe::Game.new_game
      STARTUP_OPTION_HANDLER[setup_type(arg)].call(game, arg)
      TicTacToe::PlayMatchSet.call(game)
    end

    def setup_type(arg)
      return :automated_setup unless arg == '--manual_setup'

      :manual_setup
    end
  end
end
