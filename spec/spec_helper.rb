require 'webmock/rspec'
require 'fixtures'
require_relative '../lib/task_cli'

ENV['TASK_CLI_BASE_URL'] = 'http://www.test.com'
ENV['TASK_CLI_USERNAME'] = 'SomeUser'
ENV['TASK_CLI_PASSWORD'] = 'SomePassword'

def stub_api(method, path)
  stub_request(method, 'www.test.com' + path)
    .with(headers: { 'Authorization' => 'Basic U29tZVVzZXI6U29tZVBhc3N3b3Jk' })
end
