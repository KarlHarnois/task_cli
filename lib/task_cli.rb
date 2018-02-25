require 'task_cli/command'
require 'colorize'

class TaskCli
  def self.call(args)
    Command.matching(args).run
  end
end
