require_relative '../automated_init'

context "Sample" do
  executions = 0

  result = Sample.() do
    executions += 1
  end

  test "Action is executed once" do
    assert(executions == 1)
  end

  test "Result is returned" do
    assert(result.instance_of?(Sample::Result))
  end

  context "Result" do
    test "Cycles is increased by one" do
      assert(result.cycles == 1)
    end

    test "Warmup cycles is not increased" do
      assert(result.warmup_cycles == 0)
    end
  end
end
