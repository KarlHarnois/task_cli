require 'task_cli/deserializers/task_deserializer'
require 'task_cli/formatters/task_formatter'
require 'task_cli/api_client'
require 'task_cli/config'

class TaskCli
  def self.call(args)
    new(args).send(:call)
  end

  private

  def initialize(args)
    @args = args
  end

  def call
    TaskFormatter.new.format_list(tasks)
  end

  def tasks
    TaskDeserializer.new(client.fetch_tasks).to_array
  end

  def client
    ApiClient.new(Config.new)
  end
end
