# For tic-tac-toe each position:
#  is or is not occupied by a token.
#  has a list of adjascent positions
#       0 | 1 | 2
#       ---------
#       3 | 4 | 5
#       ---------
#       6 | 7 | 8
#
#  position_1 is adjacent to positions 2,3, and 4.
#

module TTT_position_adjancency

  # numbering is left to right, top to bottom.
  # the TTT (tic tac toe) board is a 3x3 square.
  TTT_POSITION_ADJACENCY_HASH = {
    0 => {"V" => [3],
          "H" => [1],
          "LD" => [4],
          "RD" => []},
    1 => {"V" => [4],
          "H" => [0,2],
          "LD" => [],
          "RD" => []},
    2 => {"V" => [5],
          "H" => [1],
          "RD" => [4],
          "LD" => []},
    3 => {"V" => [0,6],
          "H" => [4],
          "LD" => [],
          "RD" => []},
    4 => {"V" => [1,7],
          "H" => [3,5],
          "LD" => [0,8],
          "RD" => [2,6]},
    5 => {"V" => [2,8],
          "H" => [4],
          "LD" => [],
          "RD" => []},
    6 => {"V" => [3],
          "H" => [7],
          "LD" => [],
          "RD" => [4]},
    7 => {"V" => [4],
          "H" => [6,8],
          "LD" => [],
          "RD" => []},
    8 => {"V" => [5],
          "H" => [7],
          "RD" => [],
          "LD" => [4]}
  }
end

module TicTacToe
  class Position
    include TTT_position_adjancency
    attr_accessor :pos_id, :player_token, :pos_adj
    @@positioncount = 0

    def self.call(i)
      @@positioncount += 1
      new(i).call()
    end

    def initialize(i)
      @pos_id = i
      @player_token = nil
      @pos_adj = TTT_position_adjancency::TTT_POSITION_ADJACENCY_HASH[i]
    end

    def get_nearest_neighbors(direction)
      return @pos_adj[direction]
    end

    def call()
      return self
    end

  end
end

