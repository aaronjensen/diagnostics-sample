require_relative '../automated_init'

context "Result" do
  context "Warmup Cycle Time Standard Deviation" do
    result = Sample::Result.new

    warmup_cycle_times = Controls::StandardDeviation.values

    standard_deviation = Controls::StandardDeviation.result

    warmup_cycle_times.each do |elapsed_time|
      result.warmup_cycle(elapsed_time)
    end

    test do
      assert(result.warmup_cycle_time_standard_deviation == standard_deviation)
    end
  end
end
