require_relative '../command'

class TaskCli
  class HelpCommand < Command
    name :help

    def run
      [
        'Usage: task_cli [COMMAND]',
        'Type task_cli help [COMMAND] for more details:'
      ]
    end
  end
end
