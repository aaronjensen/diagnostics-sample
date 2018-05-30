require_relative '../automated_init'

context "Result" do
  context "Mean Cycle Time" do
    result = Sample::Result.new

    result.cycles = 2
    result.cycle_time_milliseconds = 6.0

    assert(result.mean_cycle_time_milliseconds == 3.0)

    result.cycle(9.0)

    test "Mean is calculated by dividing elapsed time by cycles" do
      assert(result.mean_cycle_time_milliseconds == 5.0)
    end
  end
end
