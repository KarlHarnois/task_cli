class TaskCli
  class Flag
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def parse(args)
      expected_args.any? { |a| args.include? a }
    end

    private

    def expected_args
      ["--#{name}", "-#{name.to_s.chars.first}"]
    end
  end
end
