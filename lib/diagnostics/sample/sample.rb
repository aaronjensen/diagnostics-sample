module Diagnostics
  class Sample
    include Log::Dependency

    dependency :measure, Measure

    def configure(action: nil, gc: nil)
      Measure.configure(self, action: action, gc: gc)
    end

    attr_writer :cycles
    def cycles
      @cycles ||= Defaults.cycles
    end

    attr_writer :warmup_cycles
    def warmup_cycles
      @warmup_cycles ||= Defaults.warmup_cycles
    end

    def result
      @result ||= Result.new
    end

    def self.build(cycles=nil, warmup_cycles: nil, gc: nil, &action)
      instance = new

      instance.cycles = cycles unless cycles.nil?
      instance.warmup_cycles = warmup_cycles unless warmup_cycles.nil?

      instance.configure(action: action, gc: gc)
      instance
    end

    def self.call(cycles=nil, warmup_cycles: nil, gc: nil, &action)
      instance = build(cycles, warmup_cycles: warmup_cycles, gc: gc, &action)
      instance.()
    end

    def call
      logger.trace { "Starting warmup (Warmup Cycles: #{warmup_cycles})" }

      warmup_cycles.times do
        elapsed_time_nanoseconds = measure.()

        elapsed_time = milliseconds(elapsed_time_nanoseconds)

        result.warmup_cycle(elapsed_time)
      end

      logger.debug { "Finished warmup (Warmup Cycles: #{warmup_cycles})" }

      logger.trace { "Starting sample (Cycles: #{cycles}, Warmup Cycles: #{warmup_cycles})" }

      cycles.times do
        elapsed_time_nanoseconds = measure.()

        elapsed_time = milliseconds(elapsed_time_nanoseconds)

        result.cycle(elapsed_time)
      end

      logger.info { "Finished sample (Cycles: #{cycles}, Warmup Cycles: #{warmup_cycles}, Mean Cycle Time: #{result.mean_cycle_time_milliseconds}ms)" }

      result
    end

    def milliseconds(nanoseconds)
      Rational(nanoseconds, 1_000_000)
    end
  end
end
