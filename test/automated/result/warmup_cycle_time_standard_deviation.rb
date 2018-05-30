require_relative '../automated_init'

context "Result" do
  context "Warmup Cycle Time Standard Deviation" do
    result = Sample::Result.new

    warmup_cycle_times = [2, 4, 4, 4, 5, 5, 7, 9]

    standard_deviation = 2

    warmup_cycle_times.each do |elapsed_time|
      result.warmup_cycle(elapsed_time)
    end

    test do
      assert(result.warmup_cycle_time_standard_deviation == standard_deviation)
    end
  end
end
