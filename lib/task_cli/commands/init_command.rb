require_relative '../command'

class TaskCli
  class InitCommand < Command
    description 'create task'
    name :init
    argument :name

    def run
      return errors unless errors.empty?
      task = client.create_task(name: argument)
      ["Created task: #{task.name}"]
    end
  end
end
