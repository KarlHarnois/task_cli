require_relative '../command'

class TaskCli
  class CompleteCommand < Command
    name :complete
    argument :id

    def run
      errors
    end
  end
end
