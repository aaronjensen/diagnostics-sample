require_relative '../automated_init'

context "Result" do
  context "Warmup Cycle" do
    context do
      result = Sample::Result.new

      result.warmup_cycles = 11
      result.warmup_cycle_time_milliseconds = 11.1

      result.warmup_cycle(1.0)

      test "Warmup cycles is incremented" do
        assert(result.warmup_cycles == 12)
      end

      test "Total warmup cycle time is increased by elapsed time" do
        assert(result.warmup_cycle_time_milliseconds == 12.1)
      end
    end

    context "Mean Warmup Cycle Time" do
      result = Sample::Result.new

      result.warmup_cycles = 2
      result.warmup_cycle_time_milliseconds = 6.0

      result.warmup_cycle(9.0)

      test "Value is adjusted to include given cycle" do
        assert(result.mean_warmup_cycle_time_milliseconds == 5.0)
      end
    end
  end
end
