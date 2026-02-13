require_relative '../lib/tic_tac_toe/display_game'
require_relative '../lib/tic_tac_toe/ttt_help'
require_relative '../lib/tic_tac_toe/game'
require_relative '../lib/tic_tac_toe/player'
require_relative '../lib/tic_tac_toe/setup_new_game'

describe TicTacToe::SetupNewGame do
  let(:players_array) { [] }
  let(:game) { instance_double(TicTacToe::Game, players: players_array) }

  before do
    allow($stdout).to receive(:write)
  end

  describe '#self.call' do
    before do
      allow(game).to receive(:display_game_opening_msg)
      allow(game).to receive(:number_of_matches=)

      allow_any_instance_of(described_class).to receive(:display_setup_help_message)
      allow_any_instance_of(described_class).to receive(:number_of_matches)
      allow_any_instance_of(described_class).to receive(:get_player_name)
      allow_any_instance_of(described_class).to receive(:get_token_name)
    end

    it 'create players manually from player inputs' do
      allow_any_instance_of(described_class).to receive(:players).and_return([
        { 'name' => 'Alice', 'token' => 'X', 'computer' => false }, # rubocop:disable Layout/FirstArrayElementIndentation
        { 'name' => 'Bob', 'token' => 'O', 'computer' => false }]) # rubocop:disable Layout/MultilineArrayBraceLayout

      expect do
        described_class.call(game, '--manual_setup')
      end.to change { players_array.size }.by(2)

      expect(players_array.all? { |item| item.is_a?(TicTacToe::Player) }).to be(true)
    end

    def expect_default_player(player, name:, token:, computer:)
      expect(player.player_name).to eq(name)
      expect(player.default_token_name).to eq(token)
      expect(player.computer_player).to eq(computer)
    end

    it 'create players using a standard player v computer template' do
      expect do
        described_class.call(game)
      end.to change { players_array.size }.by(2)

      expect(players_array.all? { |item| item.is_a?(TicTacToe::Player) }).to be(true)
      expect_default_player(players_array[0],
                            name: 'Player 1',
                            token: 'X',
                            computer: false)

      expect_default_player(players_array[1],
                            name: 'Player 2',
                            token: 'O',
                            computer: true)
    end
  end

  describe '#number_of_matches' do
    before do
      allow(game).to receive(:number_of_matches=)
    end

    it 'accept and update match_count' do
      allow($stdin).to receive(:gets).and_return("a\n", "-2\n", "4\n")
      expect(game).to receive(:number_of_matches=).with(4)
      described_class.new.number_of_matches(game)
    end
  end

  describe '#get_player_name (default override)' do
    let(:player_dict) { {} }

    it 'human player name entered.' do
      allow($stdin).to receive(:gets).and_return("Bobby\n")
      described_class.new.get_player_name(player_dict)
      expect(player_dict['name']).to eq('Bobby')
      expect(player_dict['computer']).to eq(nil)
    end

    it 'computer player, no name given.' do
      allow($stdin).to receive(:gets).and_return("\n")
      described_class.new.get_player_name(player_dict)
      expect(player_dict['name']).to eq(nil)
      expect(player_dict['computer']).to eq(true)
    end

    describe '#get_token_name (default override)' do
      it 'player selects X' do
        allow($stdin).to receive(:gets).and_return("X\n")
        described_class.new.get_token_name(player_dict)
        expect(player_dict['token']).to eq('X')
      end
      it 'player selects lower case x, assigned X' do
        allow($stdin).to receive(:gets).and_return("x\n")
        described_class.new.get_token_name(player_dict)
        expect(player_dict['token']).to eq('X')
      end
      it 'player selects lower case bobby, assigned  B' do
        allow($stdin).to receive(:gets).and_return("bobby\n")
        described_class.new.get_token_name(player_dict)
        expect(player_dict['token']).to eq('B')
      end
      it 'No selection, no override value' do
        allow($stdin).to receive(:gets).and_return("\n")
        described_class.new.get_token_name(player_dict)
        expect(player_dict['token']).to eq(nil)
      end
    end
  end
end
