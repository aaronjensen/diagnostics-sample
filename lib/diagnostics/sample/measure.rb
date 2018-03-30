module Diagnostics
  class Sample
    class Measure
      include Log::Dependency

      dependency :clock, Clock

      attr_writer :gc
      def gc
        @gc ||= Defaults.gc
      end

      initializer :action

      def configure(gc: nil)
        self.gc = gc unless gc.nil?

        Clock.configure(self)
      end

      def self.build(gc: nil, &action)
        instance = new(action)
        instance.configure(gc: gc)
        instance
      end

      def self.call(gc: nil, &action)
        instance = build(gc: gc, &action)
        instance.()
      end

      def call
        logger.trace { "Measuring action (GC: #{gc.inspect})" }

        ::GC.disable unless gc

        start_time = clock.now

        action.()

        end_time = clock.now

        ::GC.enable unless gc

        elapsed_time = end_time - start_time

        logger.trace { "Action measured (GC: #{gc.inspect}, Elapsed Time: #{LogText.elapsed_time_milliseconds(elapsed_time)})" }

        elapsed_time
      end

      module LogText
        def self.elapsed_time_milliseconds(elapsed_time_nanoseconds)
          "%fms" % Rational(elapsed_time_nanoseconds, 1_000_000)
        end
      end
    end
  end
end
