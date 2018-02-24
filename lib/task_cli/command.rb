require_relative 'api_client'

class TaskCli
  class Command
    def initialize(args)
      @args = args
    end

    def client
      @client ||= ApiClient.new
    end

    def match_arguments?
      cmd = @args.first
      name.to_s == cmd || abbr_name == cmd
    end

    def argument
      @args[1]
    end

    class << self
      def matching(args)
        descendants.map { |d| d.new(args) }.detect(&:match_arguments?)
      end

      def name(value)
        define_method(:name) { value }
      end

      def descendants
        load_commands
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      def load_commands
        Dir[File.dirname(__FILE__) + '/commands/*.rb'].each { |file| require file }
      end
    end

    private

    def abbr_name
      name.to_s.chars.first
    end
  end
end
