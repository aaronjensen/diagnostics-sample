require_relative '../automated_init'

context "Result" do
  context "Warmup Cycle Frequency" do
    result = Sample::Result.new

    result.warmup_cycles = 4
    result.warmup_cycle_time_milliseconds = 100.0

    assert(result.warmup_cycle_frequency == 40)

    result.warmup_cycle(100.0)

    test "Frequency is calculated by dividing cycles by elapsed time" do
      assert(result.warmup_cycle_frequency == 25)
    end
  end
end
