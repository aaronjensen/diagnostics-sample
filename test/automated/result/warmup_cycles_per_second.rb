require_relative '../automated_init'

context "Result" do
  context "Warmup Cycles Per Second" do
    result = Sample::Result.new

    result.warmup_cycles = 4
    result.warmup_cycle_time_milliseconds = 100.0

    assert(result.warmup_cycles_per_second == 40)

    result.warmup_cycle(100.0)

    test "Warmup cycles is divided by elapsed warmup cycle time" do
      assert(result.warmup_cycles_per_second == 25)
    end
  end
end
