module Diagnostics
  class Sample
    module Controls
      module Result
        def self.example
          result = Sample::Result.new

          StandardDeviation::Values.example.each do |value|
            result.cycle(value)
          end

          result
        end

        module Digest
          def self.example
            values = [
              StandardDeviation::Values.sum,
              StandardDeviation::Values.mean,
              StandardDeviation::Values.frequency,
              StandardDeviation::Result.example
            ]

            <<~TEXT % values
              Cycle Time: %fms
              Mean Cycle Time: %fms
              Cycles Per Second: %f
              Cycle Time Standard Deviation: %fms
            TEXT
          end
        end
      end
    end
  end
end
