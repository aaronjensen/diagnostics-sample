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

          def self.example
            <<~TEXT % [count, sum, mean, standard_deviation, frequency]
              Cycles: %d
              Time: %fms
              Mean Time: %fms (± %fms)
              Cycles Per Second: %f
            TEXT
          end
        end
      end
    end
  end
end
