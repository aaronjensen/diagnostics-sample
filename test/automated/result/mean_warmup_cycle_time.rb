require_relative '../automated_init'

context "Result" do
  context "Mean Warmup Cycle Time" do
    result = Sample::Result.new

    values = Controls::Mean.values

    values.each do |value|
      result.warmup_cycle(value)
    end

    test "Mean is calculated by dividing elapsed time by warmup cycles" do
      control_mean = Controls::Mean.result

      assert(result.mean_warmup_cycle_time_milliseconds == control_mean)
    end
  end
end
