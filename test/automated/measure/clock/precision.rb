require_relative '../../automated_init'

context "Measure" do
  context "Clock" do
    context "Precision" do
      sleep_duration = 0.001

      clock = Sample::Measure::Clock.new

      t0 = clock.now

      sleep(sleep_duration)

      t1 = clock.now

      elapsed_time = t1 - t0

      test "Nanosecond resolution" do
        assert(elapsed_time > 1_000_000)
        assert(elapsed_time < 2_000_000)
      end
    end
  end
end
