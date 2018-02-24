require 'spec_helper'
require_relative '../../lib/task_cli/flag'

RSpec.describe TaskCli::Flag do
  subject { described_class.new(:verbose) }

  describe '#name' do
    it 'has the correct value' do
      expect(subject.name).to eq :verbose
    end
  end

  describe '#parse' do
    context 'when flag is present in args' do
      it 'returns true' do
        expect(subject.parse(%w[create something --verbose])).to be true
      end
    end

    context 'when abbreviated flag is present in args' do
      it 'returns true' do
        expect(subject.parse(%w[create something -v])).to be true
      end
    end

    context 'when flag is absent from args' do
      it 'returns false' do
        expect(subject.parse(%w[create something])).to eq false
      end
    end
  end
end
