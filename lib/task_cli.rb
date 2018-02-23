require 'task_cli/command'

class TaskCli
  def self.call(args)
    Command.matching(args).run
  end
end
