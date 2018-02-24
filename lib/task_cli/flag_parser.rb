class TaskCli
  class FlagParser
    def initialize(flags, args)
      @flags = flags.map { |f| Flag.new(f) }
      @args = args
    end

    def to_h
      @flags
        .map { |flag| { flag.name => flag.parse(@args) } }
        .reduce({}, :merge)
    end
  end
end
