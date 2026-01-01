# lib/my_project/app.rb
module TicTacToe
  class App

    def run(args)
      # puts "::App.run Running with arguments: #{args.inspect}"

      if args.length == 0
        arg = "--showoptions"
      else
        arg = args[0]
      end

      if arg == "--showoptions"
        game = TicTacToe::Game.new_game()
        TicTacToe::SetupNewGame.call(game, arg)
      else
        arg = arg.to_i
        game = TicTacToe::Game.new_game(arg)
        TicTacToe::SetupNewGame.call(game)
      end

      game.display_game_opening_msg()
      TicTacToe::PlayMatchSet.call(game)

    end
  end
end