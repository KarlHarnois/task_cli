require 'spec_helper'

RSpec.describe 'create Command' do
  before do
    stub_api(:post, '/tasks').and_return(body: Fixtures.task)
  end

  describe 'create' do
    context 'when name argument is present' do
      let!(:output) { task_cli 'create', 'Clean storage' }

      it 'sends the correct request' do
        expect(api_request(:post, '/tasks').with(body: { 'name' => 'Clean storage' })).to have_been_made
      end

      it 'returns the correct output' do
        expect(output).to eq ['Created task:', '<1> Configure new HHKB']
      end
    end

    context 'when name argument is absent' do
      let!(:output) { task_cli 'create' }

      it 'sends no requests' do
        expect(api_request(:post, '/tasks')).to_not have_been_made
      end

      it 'returns an error' do
        expect(output).to eq 'Missing argument <name> in "task_cli create <name>"'
      end
    end
  end
end
