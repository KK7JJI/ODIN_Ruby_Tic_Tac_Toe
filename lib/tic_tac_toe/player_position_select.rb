# frozen_string_literal: true

module TicTacToe
  # Collect player's next token position.
  module PlayerPositionSelect
    PLAYER_SELECT_HANDLER = {
      computer: lambda do |match, _|
        get_random_position(match)
      end,
      human: lambda do |match, player|
        val = TicTacToe::PlayerInput.call(match.board, player.player_name)
        match.board.ttt_board[val]
      end
    }.freeze

    def get_random_position(match)
      (match.board.ttt_board.filter do |pos|
        true if pos.player_token.nil?
      end).sample
    end

    module_function :get_random_position
  end
end
