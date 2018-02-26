require_relative '../command'

class TaskCli
  class HelpCommand < Command
    name :help

    def run
      header + commands_summary
    end

    private

    def header
      [
        'Usage: task_cli [COMMAND]',
        'Type task_cli help [COMMAND] for more details:'
      ]
    end

    def commands_summary
      Command.all
             .select(&:description)
             .sort_by(&:name)
             .map { |cmd| "#{cmd.name}: #{cmd.description}" }
    end
  end
end
