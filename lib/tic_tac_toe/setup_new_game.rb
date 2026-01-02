# frozen_string_literal: true

module TicTacToe
  # A service class used to setup a new tic tac toe game.
  # it adds player information and the number of matches
  # per set.
  class SetupNewGame
    include TicTacToe::TTTHelp

    def self.call(new_game, arg = nil)
      if arg == '--showoptions'
        new.manualsetup(new_game)
      else
        new.autosetup(new_game)
      end
    end

    def initialize
      @player1 = { 'name' => 'Player 1',
                   'computer' => false,
                   'token' => 'X' }
      @player2 = { 'name' => 'Player 2',
                   'computer' => false,
                   'token' => 'O' }
      @match_count = 2
    end

    def manualsetup(new_game)
      display_setup_help_message

      number_of_matches
      get_player_name(@player1)
      get_token_name(@player1)
      puts ''
      get_player_name(@player2)
      get_token_name(@player2)

      new_game.players.push(TicTacToe::Player.add_player(
                              @player1['name'], @player1['token'], @player1['computer']
                            ))
      new_game.players.push(TicTacToe::Player.add_player(
                              @player2['name'], @player2['token'], @player2['computer']
                            ))

      new_game.number_of_matches = @match_count
    end

    def number_of_matches
      num = -1
      print 'How many matches should we play (number)?: '
      while num < 1
        num = $stdin.gets.chomp.to_i
        print 'enter a number: ' if num < 1
      end

      @match_count = num
    end

    def get_player_name(player)
      print "#{player['name']} Name (enter = computer):"
      name = $stdin.gets.chomp
      if name.empty?
        player['computer'] = true
      else
        player['name'] = name
      end
    end

    def get_token_name(player)
      print "#{player['name']} token name (enter = #{player['token']}:)"
      token = $stdin.gets.chomp
      player['token'] = token[0].upcase if token.length.positive?
      return unless token.length > 1

      puts "Using '#{token[0].upcase}'."
    end

    def autosetup(new_game)
      new_game.players.push(TicTacToe::Player.add_player(
                              @player1['name'], @player1['token'], @player1['computer']
                            ))
      new_game.players.push(TicTacToe::Player.add_player(
                              @player2['name'], @player2['token'], @player2['computer']
                            ))
    end
  end
end
