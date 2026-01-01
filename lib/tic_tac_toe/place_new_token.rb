module TicTacToe
  class PlaceNewToken

    def self.call(cur_player, this_position)
      new().call(cur_player, this_position)
    end

    def call(cur_player, this_position)
      this_position.player_token = cur_player.player_tokens[-1]
      cur_player.player_tokens[-1].position = this_position
    end

  end
end