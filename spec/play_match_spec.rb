require_relative '../lib/tic_tac_toe/display_game'
require_relative '../lib/tic_tac_toe/ttt_help'
require_relative '../lib/tic_tac_toe/match'
require_relative '../lib/tic_tac_toe/match_end_handler'
require_relative '../lib/tic_tac_toe/player_position_select'
require_relative '../lib/tic_tac_toe/game'
require_relative '../lib/tic_tac_toe/place_new_token'
require_relative '../lib/tic_tac_toe/board'
require_relative '../lib/tic_tac_toe/update_match_status'
require_relative '../lib/tic_tac_toe/player_token'
require_relative '../lib/tic_tac_toe/play_match'
require_relative '../lib/tic_tac_toe/position'
require_relative '../lib/tic_tac_toe/setup_new_tictactoe_board'

describe TicTacToe::PlayMatch do
  subject(:pm) { TicTacToe::PlayMatch.new }
  let(:game) { instance_double(TicTacToe::Game) }
  let(:match) { instance_double(TicTacToe::Match) }

  let(:player1) { TicTacToe::Player.new('Bobby', 'X', false) }
  let(:player2) { TicTacToe::Player.new('Player 1', 'O', true) }

  describe '#call' do
    before do
      allow(game).to receive(:players)
      allow(match).to receive(:display_match_start_message)
      allow(match).to receive(:display_match_end_message)
      allow(pm).to receive(:display_match_header)
      allow(match).to receive(:increment_round_counter)
      allow(pm).to receive(:playround)
    end

    it 'playround loop executes 4 times.' do
      allow(match).to receive(:match_ended?).and_return(false, false, false, true)
      expect(match).to receive(:display_match_start_message).exactly(1).times
      expect(match).to receive(:display_match_end_message).exactly(1).times

      expect(pm).to receive(:display_match_header).exactly(4).times
      expect(match).to receive(:increment_round_counter).exactly(4).times
      expect(pm).to receive(:playround).exactly(4).times
      pm.call(game, match)
    end
  end
  describe '#playround' do
    before do
      allow(game).to receive(:players).and_return(
        [player1, player2]
      )

      allow(pm).to receive(:player_turn)
      allow(pm).to receive(:display_current_board)
      allow(match).to receive(:board)
    end

    it 'playround neither player wins' do
      allow(match).to receive(:match_ended?).and_return(false, false)

      expect(pm).to receive(:player_turn).twice
      expect(pm).to receive(:display_current_board).twice
      result = pm.playround(match, game.players)
      expect(result).to eq(false)
    end

    it 'playround player 2 wins' do
      allow(match).to receive(:match_ended?).and_return(false, true)

      expect(pm).to receive(:player_turn).twice
      expect(pm).to receive(:display_current_board).twice
      result = pm.playround(match, game.players)
      expect(result).to eq(true)
    end
    it 'playround player 1 wins' do
      allow(match).to receive(:match_ended?).and_return(true, false)

      expect(pm).to receive(:player_turn).once
      expect(pm).to receive(:display_current_board).once
      result = pm.playround(match, game.players)
      expect(result).to eq(true)
    end
  end

  describe '#play_turn' do
    context 'player turns' do
      let(:player1) { TicTacToe::Player.new('Bobby', 'X', false) }
      let(:player2) { TicTacToe::Player.new('Player 1', 'O', true) }

      let(:match) { TicTacToe::Match.new_match(1) }
      let(:board) { TicTacToe::Board.add_ttt_board }
      let(:pos0)  { TicTacToe::Position.new(0) }
      let(:pos1)  { TicTacToe::Position.new(1) }

      before do
        stub_const('TicTacToe::PlayerPositionSelect::PLAYER_SELECT_HANDLER',
          { computer: ->(_, _) { pos0 }, # rubocop:disable Layout/ArgumentAlignment
            human: ->(_, _) { pos1 } })
        match.board = board
      end
      it 'Human player turn' do
        expect(TicTacToe::UpdateMatchStatus).to receive(:call).once
        pm.player_turn(match, player1)
        expect(player1.player_tokens[-1].position).to eq(pos1)
      end
      it 'Computer player turn' do
        expect(TicTacToe::UpdateMatchStatus).to receive(:call).once
        pm.player_turn(match, player2)
        expect(player2.player_tokens[-1].position).to eq(pos0)
      end
    end
  end
end
