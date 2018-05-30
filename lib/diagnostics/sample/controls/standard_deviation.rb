module Diagnostics
  class Sample
    module Controls
      module StandardDeviation
        # Source: https://en.wikipedia.org/wiki/Standard_deviation#Population_standard_deviation_of_grades_of_eight_students (Nathan Ladd, Wed 30 May 2018)
        def self.values
          [2, 4, 4, 4, 5, 5, 7, 9]
        end

        def self.result
          2
        end
      end
    end
  end
end
