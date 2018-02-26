require 'spec_helper'

describe 'help Command' do
  context 'when no argument is passed' do
    it 'returns the correct output' do
      expect(task_cli).to eq ["Usage: task_cli [COMMAND]\n\n",
                              "Type task_cli help [COMMAND] for more details:\n\n",
                              'complete   mark task as completed',
                              'get        fetch and display tasks',
                              'init       create task']
    end
  end
end
