require_relative 'api_client'

class TaskCli
  class Command
    def initialize(args)
      @args = args
    end

    def client
      @client ||= ApiClient.new
    end

    def match?(name)
      self.name == name || abbr_name == name
    end

    def abbr_name
      name.chars.first
    end

    class << self
      def matching(args)
        descendants
          .map { |d| d.new(args) }
          .detect { |d| d.match? args.first }
      end

      def name(value)
        define_method(:name) { value }
      end

      def descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end
    end
  end
end
