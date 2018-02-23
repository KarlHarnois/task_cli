require_relative 'api_client'
require_relative 'argument_parser'

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
      kind.to_s == cmd || abbr_kind == cmd
    end

    class << self
      def matching(args)
        descendants.map { |d| d.new(args) }.detect(&:match_arguments?)
      end

      def kind(value)
        define_method(:kind) { value }
      end

      def option(*opts)
        opts.each do |option|
          define_method(option) do
            ArgumentParser.new(@args).find(option)
          end
        end
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

    def abbr_kind
      kind.to_s.chars.first
    end
  end
end
