require_relative '../command'
require_relative '../formatters/task_formatter'

class TaskCli
  class GetCommand < Command
    name :get
    flag :all

    def run
      tasks = client.fetch_tasks(state: state)
      TaskFormatter.new.format_list(tasks)
    end

    private

    def state
      flags[:all] ? nil : :open
    end
  end
end
