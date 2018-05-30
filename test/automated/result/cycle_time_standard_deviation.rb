require_relative '../automated_init'

context "Result" do
  context "Cycle Time Standard Deviation" do
    result = Sample::Result.new

    cycle_times = Controls::StandardDeviation.values

    standard_deviation = Controls::StandardDeviation.result

    cycle_times.each do |elapsed_time|
      result.cycle(elapsed_time)
    end

    test do
      assert(result.cycle_time_standard_deviation == standard_deviation)
    end
  end
end
