require 'spec_helper'

RSpec.describe TaskCli::Command do
  describe '.matching' do
    let(:command) { described_class.matching(args) }

    context 'when argument is a command' do
      let(:args) { ['create', '-n', '"Some name"'] }

      it 'returns the matching command' do
        expect(command.kind).to eq :create
      end
    end

    context 'when argument is a command abbreviation' do
      let(:args) { ['g', '-s', 'completed'] }

      it 'returns the matching command' do
        expect(command.kind).to eq :get
      end
    end
  end
end
