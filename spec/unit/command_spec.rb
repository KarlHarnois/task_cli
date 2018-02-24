require 'spec_helper'

RSpec.describe TaskCli::Command do
  describe '.matching' do
    let(:command) { described_class.matching(args) }

    context 'when argument is a command' do
      let(:args) { ['init', '-n', '"Some name"'] }

      it 'returns the matching command' do
        expect(command.name).to eq :init
      end
    end

    context 'when argument is a command abbreviation' do
      let(:args) { ['g', '-s', 'completed'] }

      it 'returns the matching command' do
        expect(command.name).to eq :get
      end
    end
  end

  describe '#argument' do
    subject { described_class.new(args) }
    let(:args) { ['build', 'house', '--color', 'blue'] }

    it 'returns the correct value' do
      expect(subject.argument).to eq 'house'
    end
  end
end
