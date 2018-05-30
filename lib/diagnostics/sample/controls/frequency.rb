module Diagnostics
  class Sample
    module Controls
      module Frequency
        module Values
          def self.milliseconds
            [25, 25, 25, 25, 100]
          end
        end

        module Result
          def self.example
            25
          end
        end
      end
    end
  end
end
