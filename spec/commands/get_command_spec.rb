require 'spec_helper'

RSpec.describe 'get Command' do
  describe 'get' do
    context 'when used without options' do
      let(:output) { task_cli 'get' }

      before do
        stub_api(:get, '/tasks?state=open').and_return(body: Fixtures.tasks)
      end

      it 'returns the open tasks' do
        expect(output).to eq ['<1> Configure new HHKB',
                              '<2> Create dotfiles repo',
                              '<3> Write Cli for task management api']
      end
    end
  end
end
