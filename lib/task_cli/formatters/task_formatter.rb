class TaskCli
  class TaskFormatter
    def format(task)
      id = "[#{task.id}]".apply_color(:argument)
      "#{id} #{task.name}"
    end

    def format_list(tasks)
      tasks.map { |t| format(t) }
    end
  end
end
