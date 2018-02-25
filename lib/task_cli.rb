require 'task_cli/command'
require 'task_cli/string'

class TaskCli
  def self.call(args)
    Command.matching(args).run
  end
end
