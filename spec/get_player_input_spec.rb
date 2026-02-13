require_relative '../lib/tic_tac_toe/board'
require_relative '../lib/tic_tac_toe/get_player_input'

describe TicTacToe::PlayerInput do
  let(:board) { instance_double(TicTacToe::Board) }

  before do
    allow($stdout).to receive(:write)
  end

  describe '#call' do
    context 'User input is limited to values [0 ... 8]' do
      before do
        allow(board).to receive(:get_ttt_token_disp_name).and_return(' ')
        allow($stdout).to receive(:print)
      end

      it 'User input is limited to numeric values < 9' do
        allow($stdin).to receive(:gets).and_return("9\n", "@\n", "a\n", "-1\n", "8\n")
        msg = 'Invalid selection, try a number from 0 - 8.'
        expect($stdout).to receive(:puts).with(msg).exactly(4).times
        result = described_class.new.call(board, 'Bobby')
        expect(result).to eq(8)
      end

      it 'User input is limited to numeric values > -1' do
        allow($stdin).to receive(:gets).and_return("-1\n", "0\n")
        result = described_class.new.call(board, 'Bobby')
        expect(result).to eq(0)
      end
    end

    context 'User selects a position which is already occupied.'
    before do
      allow($stdout).to receive(:print)
    end
    it 'User input is limited to numeric values < 9' do
      allow(board).to receive(:get_ttt_token_disp_name).and_return('X', 'O', ' ')
      allow($stdin).to receive(:gets).and_return("0\n", "1\n", "2\n")
      msg = 'This cell is occupied, try another.'
      allow($stdout).to receive(:puts).with(msg).exactly(2).times
      result = described_class.new.call(board, 'Bobby')
      expect(result).to eq(2)
    end
  end
end
