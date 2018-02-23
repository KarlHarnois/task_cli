require_relative '../command'

class TaskCli
  class CreateCommand < Command
    kind :create
    option :name

    def run
      response = client.create_task(name: name)
      ['Created task:', "<#{response.id}> #{response.name}"]
    end
  end
end
