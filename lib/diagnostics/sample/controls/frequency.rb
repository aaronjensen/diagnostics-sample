module Diagnostics
  class Sample
    module Controls
      module Frequency
        module Values
          def self.milliseconds
            Mean::Values.example
          end
        end

        module Result
          def self.example
            1_000 / Mean::Result.example
          end
        end
      end
    end
  end
end
