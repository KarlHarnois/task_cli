require 'spec_helper'

RSpec.describe 'get Command' do
  let(:expected_output) do
    [
      '1   Configure new HHKB',
      '2   Create dotfiles repo',
      '3   Write Cli for task management api'
    ]
  end

  before do
    stub_api(:get, path).and_return(body: Fixtures.tasks)
  end

  describe 'default behavior' do
    let(:path) { '/tasks?state=open' }

    it 'returns the open tasks' do
      expect(task_cli('get')).to eq expected_output
    end
  end

  describe '--all flag' do
    let(:path) { '/tasks' }

    it 'returns all tasks' do
      expect(task_cli('get', '--all')).to eq expected_output
    end

    context 'when abbreviated' do
      it 'returns the same output' do
        expect(task_cli('get', '-a')).to eq expected_output
      end
    end
  end
end
