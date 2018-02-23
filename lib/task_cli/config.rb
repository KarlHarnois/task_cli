class TaskCli
  class Config
    class << self
      def base_url
        ENV['TASK_CLI_BASE_URL']
      end

      def username
        ENV['TASK_CLI_USERNAME']
      end

      def password
        ENV['TASK_CLI_PASSWORD']
      end
    end
  end
end
