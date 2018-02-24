require_relative '../command'

class TaskCli
  class InitCommand < Command
    name :init
    argument :name

    def run
      return errors unless errors.empty?
      response = client.create_task(name: argument)
      ['Created task:', "<#{response.id}> #{response.name}"]
    end
  end
end
