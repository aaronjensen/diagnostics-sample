module Diagnostics
  class Sample
    module Controls
      module Clock
        def self.example(**args)
          Incrementing.example(**args)
        end

        class Incrementing
          Initializer.activate(self)

          def elapsed_seconds
            @elapsed_seconds ||= 0
          end
          attr_writer :elapsed_seconds

          initializer :start_time, :interval_nanoseconds

          def self.build(interval: nil, start_time: nil)
            interval ||= Defaults.interval_seconds
            start_time ||= Defaults.start_time

            interval_nanoseconds = interval * 1_000_000

            new(start_time, interval_nanoseconds)
          end

          def self.example(**args)
            build(**args)
          end

          def next
            offset = elapsed_seconds

            self.elapsed_seconds += interval_nanoseconds

            start_time_nanoseconds + offset
          end

          def start_time_nanoseconds
            start_time.to_i * 1_000_000
          end

          alias_method :now, :next

          module Defaults
            def self.interval_seconds
              1
            end

            def self.start_time
              Time.example
            end
          end
        end

      end
    end
  end
end
