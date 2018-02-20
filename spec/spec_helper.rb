require 'webmock/rspec'
require 'fixtures'
require_relative '../lib/task_cli'

BASE_URL = 'https://www.test.com'.freeze

ENV['TASK_CLI_BASE_URL'] = BASE_URL
ENV['TASK_CLI_USERNAME'] = 'SomeUser'
ENV['TASK_CLI_PASSWORD'] = 'SomePassword'

def task_cli(*args)
  TaskCli.call(args)
end

def stub_api(method, path)
  stub_request(method, BASE_URL + path)
    .with(headers: { 'Authorization' => 'Basic U29tZVVzZXI6U29tZVBhc3N3b3Jk' })
end

def api_request(method, path)
  a_request(method, BASE_URL + path)
end
