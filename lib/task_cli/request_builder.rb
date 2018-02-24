require 'net/http'
require_relative 'config'

class TaskCli
  class RequestBuilder
    def initialize(path)
      @path = path
    end

    def get
      request = Net::HTTP::Get.new(uri)
      perform(request)
    end

    def post(body)
      request = Net::HTTP::Post.new(uri)
      request.body = body.to_json
      perform(request)
    end

    def patch(body)
      request = Net::HTTP::Patch.new(uri)
      request.body = body.to_json
      perform(request)
    end

    private

    def uri
      @uri ||= URI(Config.base_url + @path)
    end

    def perform(request)
      authorize(request)
      request[:content_type] = 'application/json'
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end
      response.body
    end

    def authorize(request)
      request.basic_auth Config.username, Config.password
    end
  end
end
