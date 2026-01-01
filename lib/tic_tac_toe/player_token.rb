module TicTacToe

  class PlayerToken
    attr_accessor :position, :player_token_disp_name, :owner
    @@token_counter = 0

    def self.add_token(owning_player)
      @@token_counter += 1
      new(owning_player).call(owning_player)
    end

    def initialize(owning_player)
      @owner = owning_player.player_name
      @position = nil
      @player_token_disp_name = owning_player.default_token_name
      @player_token_number = @@token_counter

    end

    def get_token_disp_name()
      return self.player_token_disp_name
    end

    def call(owning_player)
      owning_player.player_tokens.push(self)
    end

  end
end