require_relative '../command'

class TaskCli
  class CreateCommand < Command
    kind :create

    def run
      response = client.create_task(name: argument)
      ['Created task:', "<#{response.id}> #{response.name}"]
    end
  end
end
