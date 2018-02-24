require 'date'
require_relative '../command'
require_relative '../formatters/task_formatter'

class TaskCli
  class CompleteCommand < Command
    name :complete
    argument :id

    def run
      return errors unless errors.empty?
      task = client.update_task(argument, completed_at: Time.now.to_s)
      ['Completed task:', TaskFormatter.new.format(task)]
    end
  end
end
