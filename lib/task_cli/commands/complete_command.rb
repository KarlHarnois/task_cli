require 'date'
require_relative '../command'

class TaskCli
  class CompleteCommand < Command
    name :complete
    argument :id

    def run
      return errors unless errors.empty?
      task = client.update_task(argument, completed_at: Time.now.to_s)
      ['Completed task:', task.to_s]
    end
  end
end
