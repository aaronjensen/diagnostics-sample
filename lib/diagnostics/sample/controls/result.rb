module Diagnostics
  class Sample
    module Controls
      module Result
        extend StandardDeviation::Values
        extend self

        def self.example
          result = Sample::Result.new

          values.each do |value|
            result.cycle(value)
          end

          result
        end

        def standard_deviation
          StandardDeviation::Result.example
        end

        module Digest
          extend StandardDeviation::Values
          extend Result

          def self.gc
            false
          end

          def self.example
            <<~TEXT % [count, sum, mean, standard_deviation, frequency, gc]
              Cycles: %d
              Time: %fms
              Mean Cycle Time: %fms (± %fms)
              Cycles Per Second: %f
              GC: #{gc ? "on" : "off"}
            TEXT
          end
        end
      end
    end
  end
end
