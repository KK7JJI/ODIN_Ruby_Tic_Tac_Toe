# frozen_string_literal: true

module TicTacToe
  # On each player's turn, a token is placed on the board.
  # the last player token is the newest which was recently
  # created but not yet positioned.
  class PlaceNewToken
    def self.call(cur_player, pos)
      new.call(cur_player, pos)
    end

    def call(cur_player, pos)
      pos.player_token = cur_player.player_tokens[-1]
      cur_player.player_tokens[-1].position = pos
    end
  end
end
