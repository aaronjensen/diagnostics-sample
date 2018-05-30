require_relative '../automated_init'

context "Result" do
  context "Cycle" do
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
end
