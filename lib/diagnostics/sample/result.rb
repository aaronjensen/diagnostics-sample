module Diagnostics
  class Sample
    class Result
      include Schema::DataStructure

      attribute :cycles, Integer, default: 0
      attribute :cycle_time_milliseconds, Float, default: 0.0
      attribute :cycle_time_sum_squares, Float, default: 0.0

      attribute :warmup_cycles, Integer, default: 0
      attribute :warmup_cycle_time_milliseconds, Float, default: 0.0
      attribute :warmup_cycle_time_sum_squares, Float, default: 0.0

      attribute :gc, Boolean, default: false

      alias_method :total_time_milliseconds, :cycle_time_milliseconds

      def cycle(elapsed_time)
        self.cycle_time_milliseconds += elapsed_time

        self.cycle_time_sum_squares += (elapsed_time ** 2)

        self.cycles += 1
      end

      def mean_cycle_time_milliseconds
        cycle_time_milliseconds / cycles
      end

      def cycles_per_second
        cycles / (cycle_time_milliseconds / 1_000)
      end

      def cycle_time_standard_deviation
        variance = (cycle_time_sum_squares / cycles) - (mean_cycle_time_milliseconds ** 2)

        Math.sqrt(variance)
      end
      alias_method :standard_deviation, :cycle_time_standard_deviation

      def warmup_cycle(elapsed_time)
        self.warmup_cycle_time_milliseconds += elapsed_time

        self.warmup_cycle_time_sum_squares += (elapsed_time ** 2)

        self.warmup_cycles += 1
      end

      def mean_warmup_cycle_time_milliseconds
        warmup_cycle_time_milliseconds / warmup_cycles
      end

      def warmup_cycles_per_second
        warmup_cycles / (warmup_cycle_time_milliseconds / 1_000)
      end

      def warmup_cycle_time_standard_deviation
        variance = (warmup_cycle_time_sum_squares / warmup_cycles) - (mean_warmup_cycle_time_milliseconds ** 2)

        Math.sqrt(variance)
      end

      def digest
        <<~TEXT % [cycles, total_time_milliseconds, mean_cycle_time_milliseconds, standard_deviation, cycles_per_second, gc]
          Cycles: %d
          Time: %fms
          Mean Time: %fms (± %fms)
          Cycles Per Second: %f
          GC: #{gc ? 'on' : 'off'}
        TEXT
      end
      alias_method :to_s, :digest
    end
  end
end
