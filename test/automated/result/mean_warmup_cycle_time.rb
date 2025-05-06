require_relative "../automated_init"

context "Result" do
  context "Mean Warmup Cycle Time" do
    result = Sample::Result.new

    values = Controls::Mean::Values.example

    values.each do |value|
      result.warmup_cycle(value)
    end

    test "Mean is calculated by dividing elapsed time by warmup cycles" do
      control_mean = Controls::Mean::Result.example

      assert(result.mean_warmup_time_milliseconds == control_mean)
    end
  end
end
