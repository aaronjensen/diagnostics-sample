require_relative '../automated_init'

context "Result" do
  context "Time Standard Deviation" do
    result = Sample::Result.new

    times = Controls::StandardDeviation::Values.example

    times.each do |elapsed_time|
      result.cycle(elapsed_time)
    end

    test do
      control_standard_deviation = Controls::StandardDeviation::Result.example

      assert(result.time_standard_deviation == control_standard_deviation)
    end
  end
end
