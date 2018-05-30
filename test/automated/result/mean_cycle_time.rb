require_relative '../automated_init'

context "Result" do
  context "Mean Cycle Time" do
    result = Sample::Result.new

    values = Controls::Mean::Values.example

    values.each do |value|
      result.cycle(value)
    end

    test "Mean is calculated by dividing elapsed time by cycles" do
      control_mean = Controls::Mean::Result.example

      assert(result.mean_cycle_time_milliseconds == control_mean)
    end
  end
end
