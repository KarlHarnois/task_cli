require 'spec_helper'
require 'date'

RSpec.describe 'complete Command' do
  before do
    stub_api(:patch, '/tasks/1').and_return(body: Fixtures.task)
  end

  describe 'id argument' do
    context 'when absent' do
      it 'returns the correct error' do
        expect(task_cli('complete')).to eq ["Missing argument [ID] in 'task_cli complete [ID]'"]
      end
    end

    context 'when present' do
      let!(:output) { task_cli 'complete', '1' }

      it 'returns the correct output' do
        expect(output).to eq ['Completed task:', '[1] Configure new HHKB']
      end

      it 'sends the correct request' do
        expect(api_request(:patch, '/tasks/1')
          .with(body: { 'completed_at' => Time.now.to_s })).to have_been_made
      end
    end
  end
end
