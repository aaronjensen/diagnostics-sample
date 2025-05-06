require_relative "../automated_init"

context "Sample" do
  context "Optional Warmup Cycles" do
    executions = 0

    result = Sample.(1, warmup_cycles: 2) do
      executions += 1
    end

    test "Action is executed once for each cycle and warmup cycle" do
      assert(executions == 3)
    end

    refute(result.nil?)

    context "Result" do
      test "Warmup cycles is incremented once for each warmup cycle" do
        assert(result.warmup_cycles == 2)
      end

      test "Cycles is incremented once for each cycle" do
        assert(result.cycles == 1)
      end
    end
  end
end
