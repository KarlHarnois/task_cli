class TaskCli
  class Config
    attr_reader :base_url, :username, :password

    def initialize
      @base_url = ENV['TASK_CLI_BASE_URL']
      @username = ENV['TASK_CLI_USERNAME']
      @password = ENV['TASK_CLI_PASSWORD']
    end
  end
end
