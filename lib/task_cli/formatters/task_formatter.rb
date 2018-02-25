class TaskCli
  class TaskFormatter
    def format(task)
      id = "[#{task.id}]".colorize(:light_black)
      "#{id} #{task.name}"
    end

    def format_list(tasks)
      tasks.map { |t| format(t) }
    end
  end
end
