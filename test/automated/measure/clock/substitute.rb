require_relative '../../automated_init'

context "Measure" do
  context "Clock" do
    context "Substitute" do
      context "Current Time Set" do
        current_time_nanoseconds = 1

        substitute = SubstAttr::Substitute.build(Sample::Measure::Clock)

        substitute.now = current_time_nanoseconds

        test "Returns current time" do
          assert(substitute.now == current_time_nanoseconds)
        end
      end

      context "Current Time Not Set" do
        substitute = SubstAttr::Substitute.build(Sample::Measure::Clock)

        test "Returns nothing" do
          assert(substitute.now == nil)
        end
      end
    end
  end
end
