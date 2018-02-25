require_relative '../command'

class TaskCli
  class InitCommand < Command
    name :init
    argument :name

    def run
      return errors unless errors.empty?
      task = client.create_task(name: argument)
      ['Created task:', task.to_s]
    end
  end
end
