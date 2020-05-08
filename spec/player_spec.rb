require 'player'

describe Player do
  subject(:john) { Player.new('John') }
  subject(:steve) { Player.new('Steve') }

  describe '#name' do
    it 'shows the name of the player' do
      expect(john.name).to eq 'John'
    end
  end

  describe '#hit_points' do
    it 'return hit points' do
      expect(john.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive_damage' do
    it 'reduces the player points' do
      expect { john.receive_damage }.to change { john.hit_points }.by(-10)
    end
  end
end
