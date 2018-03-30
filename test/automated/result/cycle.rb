require_relative '../automated_init'

context "Result" do
  context "Cycle" do
    context do
      result = Sample::Result.new

      result.cycles = 11
      result.cycle_time_milliseconds = 11.1

      result.cycle(1.0)

      test "Cycles is incremented" do
        assert(result.cycles == 12)
      end

      test "Total cycle time is increased by elapsed time" do
        assert(result.cycle_time_milliseconds == 12.1)
      end
    end

    context "Mean Cycle Time" do
      result = Sample::Result.new

      result.cycles = 2
      result.cycle_time_milliseconds = 6.0

      result.cycle(9.0)

      test "Value is adjusted to include given cycle" do
        assert(result.mean_cycle_time_milliseconds == 5.0)
      end
    end
  end
end
