require 'json'
require_relative '../models/task'

class TaskCli
  class TaskDeserializer
    def initialize(json)
      @json = JSON.parse(json)
    end

    def to_item
      Task.new(@json)
    end

    def to_list
      @json.map { |json| Task.new(json) }
    end
  end
end
