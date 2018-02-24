class TaskCli
  class TaskFormatter
    def format(task)
      "<#{task.id}> #{task.name}"
    end

    def format_list(tasks)
      tasks.map { |t| format(t) }
    end
  end
end
