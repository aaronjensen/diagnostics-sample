require_relative '../automated_init'

context "Result" do
  context "Cycle Time Standard Deviation" do
    result = Sample::Result.new

    cycle_times = Controls::StandardDeviation::Values.example

    cycle_times.each do |elapsed_time|
      result.cycle(elapsed_time)
    end

    test do
      control_standard_deviation = Controls::StandardDeviation::Result.example

      assert(result.cycle_time_standard_deviation == control_standard_deviation)
    end
  end
end
