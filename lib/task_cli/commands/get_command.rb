require_relative '../command'
require_relative '../formatters/task_formatter'

class TaskCli
  class GetCommand < Command
    name 'get'

    def run
      tasks = client.fetch_tasks
      TaskFormatter.new.format_list(tasks)
    end
  end
end
