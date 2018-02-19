class TaskCli
  class TaskFormatter
    def format_list(tasks)
      tasks.map { |t| "<#{t.id}> #{t.name}" }
    end
  end
end
