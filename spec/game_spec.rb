require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  let(:player1) { double :player }
  let(:player2) { double :player }

  describe '#player1' do
    it 'gets the first player' do
      expect(game.player1).to eq player1
    end
  end

  describe '#player2' do
    it 'gets the second player' do
      expect(game.player2).to eq player2
    end
  end

  describe '#attack' do
    it 'damages a player' do
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end
end
