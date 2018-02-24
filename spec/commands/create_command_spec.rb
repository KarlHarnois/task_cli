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
  end
end
