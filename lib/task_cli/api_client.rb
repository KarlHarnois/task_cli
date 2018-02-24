require_relative 'request_builder'
require_relative 'deserializers/task_deserializer'

class TaskCli
  class ApiClient
    def fetch_tasks(state: nil)
      path = state ? "/tasks?state=#{state}" : '/tasks'
      json = get path
      TaskDeserializer.new(json).to_list
    end

    def create_task(attributes)
      json = post '/tasks', attributes
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
