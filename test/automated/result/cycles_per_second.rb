require_relative '../automated_init'

context "Result" do
  context "Cycles Per Second" do
    result = Sample::Result.new

    result.cycles = 4
    result.cycle_time_milliseconds = 100.0

    assert(result.cycles_per_second == 40)

    result.cycle(100.0)

    test "Cycles is divided by elapsed cycle time" do
      assert(result.cycles_per_second == 25)
    end
  end
end
