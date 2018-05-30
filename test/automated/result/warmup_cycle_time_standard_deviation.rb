require_relative '../automated_init'

context "Result" do
  context "Warmup Cycle Time Standard Deviation" do
    result = Sample::Result.new

    warmup_cycle_times = Controls::StandardDeviation::Values.example

    warmup_cycle_times.each do |elapsed_time|
      result.warmup_cycle(elapsed_time)
    end

    test do
      control_standard_deviation = Controls::StandardDeviation::Result.example

      assert(result.warmup_cycle_time_standard_deviation == control_standard_deviation)
    end
  end
end
