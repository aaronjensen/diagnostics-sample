require_relative '../automated_init'

context "Result" do
  context "Mean Warmup Cycle Time" do
    result = Sample::Result.new

    result.warmup_cycles = 2
    result.warmup_cycle_time_milliseconds = 6.0

    assert(result.mean_warmup_cycle_time_milliseconds == 3.0)

    result.warmup_cycle(9.0)

    test "Mean is calculated by dividing elapsed time by warmup cycles" do
      assert(result.mean_warmup_cycle_time_milliseconds == 5.0)
    end
  end
end
