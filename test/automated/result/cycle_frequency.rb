require_relative '../automated_init'

context "Result" do
  context "Cycle Frequency" do
    result = Sample::Result.new

    result.cycles = 4
    result.cycle_time_milliseconds = 100.0

    assert(result.cycle_frequency == 40)

    result.cycle(100.0)

    test "Frequency is calculated by dividing cycles by elapsed time" do
      assert(result.cycle_frequency == 25)
    end
  end
end
