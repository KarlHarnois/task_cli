require_relative 'request_builder'
require_relative 'deserializers/task_deserializer'

class TaskCli
  class ApiClient
    def fetch_tasks(state: nil)
      path = state ? "/tasks?state=#{state}" : '/tasks'
      json = get path
      parse_task_list(json)
    end

    def create_task(attributes)
      json = post '/tasks', attributes
      parse_task(json)
    end

    def update_task(id, attributes)
      json = patch "/tasks/#{id}", attributes
      parse_task(json)
    end

    private

    def get(path)
      RequestBuilder.new(path).get
    end

    def post(path, body)
      RequestBuilder.new(path).post(body)
    end

    def patch(path, body)
      RequestBuilder.new(path).patch(body)
    end

    def parse_task(json)
      TaskDeserializer.new(json).to_item
    end

    def parse_task_list(json)
      TaskDeserializer.new(json).to_list
    end
  end
end
