require 'spec_helper'

RSpec.describe 'complete Command' do
  context 'when id argument is absent' do
    it 'returns the correct error' do
      expect(task_cli('complete')).to eq ['Missing argument <id> in "task_cli complete <id>"']
    end
  end
end
