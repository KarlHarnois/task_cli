require_relative 'request_builder'
require_relative 'deserializers/task_deserializer'

class TaskCli
  class ApiClient
    def fetch_tasks
      json = get '/tasks'
      TaskDeserializer.new(json).to_list
    end

    def create_task(task)
      json = post '/tasks', 'name' => task.name
      TaskDeserializer.new(json).to_item
    end

    private

    def get(path)
      RequestBuilder.new(path).get
    end

    def post(path, body)
      RequestBuilder.new(path).post(body)
    end
  end
end
