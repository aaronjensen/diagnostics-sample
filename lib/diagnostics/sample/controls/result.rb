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
              Cycle Time (Milliseconds): %0.2f
              Mean Cycle Time (Milliseconds): %0.2f
              Cycles Per Second: %.02f
              Cycle Time Standard Deviation (Milliseconds): %.02f
            TEXT
          end
        end
      end
    end
  end
end
