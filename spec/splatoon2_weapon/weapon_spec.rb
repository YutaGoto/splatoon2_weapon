require 'spec_helper'

RSpec.describe Splatoon2Weapon::Weapon do
  describe '#all' do
    subject { described_class.all }

    specify 'weapons' do
      expect(subject.first.key).to eq :splattershot_jr
    end
  end
end
