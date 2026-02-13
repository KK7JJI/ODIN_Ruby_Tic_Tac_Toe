require_relative '../lib/tic_tac_toe/board'
require_relative '../lib/tic_tac_toe/display_game'
require_relative '../lib/tic_tac_toe/position'
require_relative '../lib/tic_tac_toe/player'
require_relative '../lib/tic_tac_toe/setup_new_tictactoe_board'
require_relative '../lib/tic_tac_toe/place_new_token'
require_relative '../lib/tic_tac_toe/player_token'
require_relative '../lib/tic_tac_toe/match'
require_relative '../lib/tic_tac_toe/update_match_status'

describe TicTacToe::UpdateMatchStatus do
  describe '#determine_match_status' do
    subject(:pm) { TicTacToe::PlayMatch.new }

    let(:player1) { TicTacToe::Player.new('Bobby', 'X', false) }
    let(:player2) { TicTacToe::Player.new('Player 1', 'O', true) }
    let(:match) { TicTacToe::Match.new_match(1) }
    let(:board) { TicTacToe::Board.add_ttt_board }

    it 'Board is full, no winner.' do
      # XOX
      # OXO
      # OXO

      TicTacToe::SetupNewTicTacToeBoard.call(board)
      match.board = board

      x_pos = [0, 2, 4, 7]
      o_pos = [1, 3, 5, 6, 8]

      x_pos.each do |i|
        TicTacToe::PlayerToken.add_token(player1)
        cur_pos = board.ttt_board[i]
        TicTacToe::PlaceNewToken.call(player1, cur_pos)
      end

      o_pos.each do |i|
        TicTacToe::PlayerToken.add_token(player2)
        cur_pos = board.ttt_board[i]
        TicTacToe::PlaceNewToken.call(player2, cur_pos)
      end

      pos = board.ttt_board[0]
      described_class.call(match, pos, player1)
      msg = 'Match ends, Tie Game.'
      expect(match.match_end_status).to eq(true)
      expect(match.match_end_msg).to eq(msg)
    end

    wins = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    wins.each do |row|
      it 'Player 1 wins, horizontal.' do
        player1 = TicTacToe::Player.new('Bobby', 'X', false)
        match = TicTacToe::Match.new_match(1)
        board = TicTacToe::Board.add_ttt_board
        TicTacToe::SetupNewTicTacToeBoard.call(board)
        match.board = board

        cur_pos = board.ttt_board[0]
        row.each do |i|
          TicTacToe::PlayerToken.add_token(player1)
          cur_pos = board.ttt_board[i]
          TicTacToe::PlaceNewToken.call(player1, cur_pos)
        end

        described_class.call(match, cur_pos, player1)
        msg = 'Match ends, Bobby wins.'
        expect(match.match_end_status).to eq(true)
        expect(match.match_end_msg).to eq(msg)
      end
    end

    wins.each do |row|
      it 'Player 1 wins, horizontal.' do
        player1 = TicTacToe::Player.new('Bobby', 'O', false)
        match = TicTacToe::Match.new_match(1)
        board = TicTacToe::Board.add_ttt_board
        TicTacToe::SetupNewTicTacToeBoard.call(board)
        match.board = board

        cur_pos = board.ttt_board[0]
        row.each do |i|
          TicTacToe::PlayerToken.add_token(player1)
          cur_pos = board.ttt_board[i]
          TicTacToe::PlaceNewToken.call(player1, cur_pos)
        end

        described_class.call(match, cur_pos, player1)
        msg = 'Match ends, Bobby wins.'
        expect(match.match_end_status).to eq(true)
        expect(match.match_end_msg).to eq(msg)
      end
    end
  end
end
