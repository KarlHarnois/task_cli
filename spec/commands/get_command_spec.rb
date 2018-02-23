require 'spec_helper'

RSpec.describe 'get Command' do
  before do
    stub_api(:get, '/tasks').and_return(body: Fixtures.tasks)
  end

  describe 'get' do
    let(:output) { task_cli 'get' }

    it 'returns all the tasks' do
      expect(output).to eq ['<1> Configure new HHKB',
                            '<2> Create dotfiles repo',
                            '<3> Write Cli for task management api']
    end
  end
end
