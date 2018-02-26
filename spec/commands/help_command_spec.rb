require 'spec_helper'

describe 'help Command' do
  context 'when no argument is passed' do
    it 'returns the correct output' do
      expect(task_cli).to eq ['Usage: task_cli [COMMAND]',
                              'Type task_cli help [COMMAND] for more details:',
                              'complete: mark task as completed',
                              'get: fetch and display tasks',
                              'init: create task']
    end
  end
end
