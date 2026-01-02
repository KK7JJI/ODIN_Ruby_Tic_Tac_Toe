# frozen_string_literal: true

module TicTacToe
  # Used in UpdateMatchStatus to handle game end
  # scenarios.
  module MatchEndHandler
    MATCH_END_HANDLERS = {
      win: lambda do |match, player|
        match.update_match_status(
          true, "Match ends, #{player.player_name} wins."
        )
        match.winner = player
        player.add_match_win
      end,
      draw: lambda do |match, _|
        match.update_match_status(
          true, 'Match ends, Tie Game.'
        )
      end,
      continue: lambda do |match, _|
        match.update_match_status(
          false, 'Ready for next move.'
        )
      end
    }.freeze
  end
end
