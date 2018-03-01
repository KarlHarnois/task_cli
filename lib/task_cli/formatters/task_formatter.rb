class TaskCli
  class TaskFormatter
    def format(task)
      id = task.id.to_s.ljust(3)
      "#{id} #{task.name}"
    end

    def format_list(tasks)
      tasks.sort_by(&:id).map do |task|
        str = format(task)
        task.completed? ? str.green : str
      end
    end
  end
end
