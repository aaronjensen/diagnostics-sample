require_relative "../automated_init"

context "Result" do
  context "Warmup Cycle" do
    result = Sample::Result.new

    result.warmup_cycles = 11
    result.warmup_time_milliseconds = 11.1

    result.warmup_cycle(1.0)

    test "Warmup cycles is incremented" do
      assert(result.warmup_cycles == 12)
    end

    test "Total warmup cycle time is increased by elapsed time" do
      assert(result.warmup_time_milliseconds == 12.1)
    end
  end
end
