module Diagnostics
  class Sample
    class Result
      include Schema::DataStructure

      attribute :cycles, Integer, default: 0
      attribute :cycle_time_milliseconds, Float, default: 0.0
      attribute :warmup_cycles, Integer, default: 0
      attribute :warmup_cycle_time_milliseconds, Float, default: 0.0

      def cycle(elapsed_time)
        self.cycle_time_milliseconds += elapsed_time

        self.cycles += 1
      end

      def warmup_cycle(elapsed_time)
        self.warmup_cycle_time_milliseconds += elapsed_time

        self.warmup_cycles += 1
      end

      def mean_cycle_time_milliseconds
        cycle_time_milliseconds / cycles
      end

      def mean_warmup_cycle_time_milliseconds
        warmup_cycle_time_milliseconds / warmup_cycles
      end
    end
  end
end
