# frozen_string_literal: true

module TicTacToe
  # A service class used to setup a new tic tac toe game.
  # it adds player information and the number of matches
  # per set.
  class SetupNewGame
    include TicTacToe::TTTHelp

    attr_accessor :players

    def self.call(new_game, arg = nil)
      if arg == '--manual_setup'
        new.manualsetup(new_game)
      else
        new.autosetup(new_game)
      end
      new_game.display_game_opening_msg
    end

    def initialize
      @players = [
        { 'name' => 'Player 1',
          'computer' => false,
          'token' => 'X' },
        { 'name' => 'Player 2',
          'computer' => true,
          'token' => 'O' }
      ]
      @match_count = 2
    end

    def manualsetup(new_game)
      display_setup_help_message
      number_of_matches(new_game)
      players.each do |player|
        get_player_name(player)
        get_token_name(player)
        puts ''
        new_game.players.push(TicTacToe::Player.add_player(
                                player['name'], player['token'], computer_player: player['computer']
                              ))
      end
    end

    def number_of_matches(new_game)
      num = -1
      print 'How many matches should we play (number)?: '
      while num < 1
        num = $stdin.gets.chomp.to_i
        print 'enter a number: ' if num < 1
      end
      new_game.number_of_matches = num
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
      players.each do |player|
        new_game.players.push(TicTacToe::Player.add_player(
                                player['name'], player['token'],
                                computer_player: player['computer']
                              ))
      end
    end
  end
end
