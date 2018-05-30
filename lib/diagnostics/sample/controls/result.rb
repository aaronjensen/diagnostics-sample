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
              StandardDeviation::Result.example,
              StandardDeviation::Values.frequency
            ]

            <<~TEXT % values
              Cycle Time: %fms
              Mean Cycle Time: %fms (± %fms)
              Cycles Per Second: %f
            TEXT
          end
        end
      end
    end
  end
end
