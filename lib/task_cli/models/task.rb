require_relative '../formatters/task_formatter'

class TaskCli
  class Task
    attr_reader :id, :name

    def initialize(hash)
      @id = hash[:id] || hash['id']
      @name = hash[:name] || hash['name']
    end

    def to_s
      TaskFormatter.new.format(self)
    end
  end
end
