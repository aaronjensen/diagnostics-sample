require_relative '../automated_init'

context "Measure" do
  executed = false

  action = proc {
    executed = true
  }

  control_elapsed_time = 0.001

  measure = Sample::Measure.new(action)

  measure.clock = Controls::Clock.example(interval: control_elapsed_time)

  elapsed_time = measure.()

  test "Action is executed" do
    assert(executed == true)
  end

  test "Returns elapsed time in nanoseconds" do
    assert(elapsed_time == control_elapsed_time * 1_000_000)
  end
end
