require 'spec_helper'
require_relative '../../lib/task_cli/flag_parser'

RSpec.describe TaskCli::FlagParser do
  subject { described_class.new(flags, args).to_h }

  describe '#to_h' do
    let(:flags) { %i[verbose all save] }
    let(:args) { %w[install something --verbose -s] }

    let(:expected) do
      {
        verbose: true,
        all: false,
        save: true
      }
    end

    it 'returns the correct output' do
      expect(subject.to_h).to include expected
    end
  end
end
