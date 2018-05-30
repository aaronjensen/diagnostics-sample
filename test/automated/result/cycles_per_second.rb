require_relative '../automated_init'

context "Result" do
  context "Cycles Per Second" do
    result = Sample::Result.new

    values = Controls::Frequency::Values.milliseconds

    values.each do |value|
      result.cycle(value)
    end

    test "Cycles is divided by elapsed cycle time" do
      control_frequency = Controls::Frequency::Result.example

      assert(result.cycles_per_second == control_frequency)
    end
  end
end
