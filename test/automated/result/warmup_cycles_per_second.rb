require_relative "../automated_init"

context "Result" do
  context "Warmup Cycles Per Second" do
    result = Sample::Result.new

    values = Controls::Frequency::Values.milliseconds

    values.each do |value|
      result.warmup_cycle(value)
    end

    test "Warmup cycles is divided by elapsed warmup cycle time" do
      control_frequency = Controls::Frequency::Result.example

      assert(result.warmup_cycles_per_second == control_frequency)
    end
  end
end
