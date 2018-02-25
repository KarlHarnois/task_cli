require_relative 'api_client'
require_relative 'flag_parser'

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

    def errors
      @errors ||= begin
                    err = []
                    err << missing_argument_error if missing_argument?
                    err
                  end
    end

    class << self
      def matching(args)
        descendants.map { |d| d.new(args) }.detect(&:match_arguments?)
      end

      def name(value)
        define_method(:name) { value }
      end

      def argument(name)
        define_method(:argument_name) { name }
      end

      def flag(*names)
        define_method(:flags) do
          @flags ||= FlagParser.new(names, @args).to_h
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

    def abbr_name
      name.to_s.chars.first
    end

    def missing_argument?
      return false unless respond_to? :argument_name
      argument.nil?
    end

    def missing_argument_error
      arg = "[#{argument_name}]".upcase.apply_color(:argument)
      "Missing argument #{arg} in " + "'task_cli #{name} #{arg}'"
    end
  end
end
