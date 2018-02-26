require 'spec_helper'

describe TaskCli::Task do
  subject { described_class.new(attr) }

  describe 'completed?' do
    context 'when task has a completion date' do
      let(:attr) { { completed_at: Time.now.to_s } }

      it 'returns true' do
        expect(subject.completed?).to eq true
      end
    end

    context 'when task has no completion date' do
      let(:attr) { {} }

      it 'returns false' do
        expect(subject.completed?).to eq false
      end
    end
  end
end
