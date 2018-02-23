class TaskCli
  class ArgumentParser
    def initialize(args)
      @args = args
    end

    def find(option)
      value = nil
      @args.each_with_index do |arg, i|
        value = @args[i + 1] if expected_args(option).include? arg
      end
      value
    end

    private

    def expected_args(option)
      ["--#{option}", "-#{option.to_s.chars.first}"]
    end
  end
end
