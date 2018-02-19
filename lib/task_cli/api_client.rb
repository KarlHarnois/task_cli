require_relative 'request_builder'

class TaskCli
  class ApiClient
    def fetch_tasks
      get '/tasks'
    end

    def create_task(task)
      post '/tasks', 'name' => task.name
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
