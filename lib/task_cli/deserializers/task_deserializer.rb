require 'json'
require_relative '../models/task'

class TaskCli
  class TaskDeserializer
    def initialize(json)
      @json = JSON.parse(json)
    end

    def to_array
      @json.map { |json| Task.new(json) }
    end
  end
end
