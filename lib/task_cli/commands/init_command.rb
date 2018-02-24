require_relative '../command'

class TaskCli
  class InitCommand < Command
    name :init

    def run
      return missing_name_error unless argument
      response = client.create_task(name: argument)
      ['Created task:', "<#{response.id}> #{response.name}"]
    end

    private

    def missing_name_error
      'Missing argument <name> in "task_cli init <name>"'
    end
  end
end
