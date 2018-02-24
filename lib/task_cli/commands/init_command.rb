require_relative '../command'
require_relative '../formatters/task_formatter'

class TaskCli
  class InitCommand < Command
    name :init
    argument :name

    def run
      return errors unless errors.empty?
      response = client.create_task(name: argument)
      ['Created task:', format_task(response)]
    end

    private

    def format_task(t)
      TaskFormatter.new.format(t)
    end
  end
end
