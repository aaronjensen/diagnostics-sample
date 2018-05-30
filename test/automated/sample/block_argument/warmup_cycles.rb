require_relative '../../automated_init'

context "Sample" do
  context "Block Argument" do
    context "Warmup Cycles" do
      arguments = []

      Sample.(1, warmup_cycles: 2) do |arg|
        arguments << arg
      end

      test "Cycle iteration number is incremented in warmup cycles" do
        assert(arguments == [0, 1, 2])
      end
    end
  end
end
