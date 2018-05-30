require_relative '../automated_init'

context "Sample" do
  context "Optional Cycles" do
    executions = 0

    result = Sample.(2) do
      executions += 1
    end

    test "Action is executed once for each cycle" do
      assert(executions == 2)
    end

    refute(result.nil?)

    context "Result" do
      test "Cycles is incremented once for each cycle" do
        assert(result.cycles == 2)
      end
    end
  end
end
