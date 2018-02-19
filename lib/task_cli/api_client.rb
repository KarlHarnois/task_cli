require 'net/http'

class TaskCli
  class ApiClient
    def initialize(config)
      @base_url = config.base_url
      @username = config.username
      @password = config.password
    end

    def fetch_tasks
      get '/tasks'
    end

    private

    def get(path)
      uri = URI(@base_url + path)
      request = Net::HTTP::Get.new(uri)
      request.basic_auth @username, @password
      perform_request(request, uri).body
    end

    def perform_request(request, uri)
      Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
    end

    def headers
      URI.encode_www_form('Authorization' => @auth_token)
    end
  end
end
