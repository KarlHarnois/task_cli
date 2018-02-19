class TaskCli
  class Task
    attr_reader :id, :name

    def initialize(hash)
      @id = hash[:id] || hash['id']
      @name = hash[:name] || hash['name']
    end
  end
end
