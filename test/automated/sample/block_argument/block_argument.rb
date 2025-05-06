require_relative "../../automated_init"

context "Sample" do
  context "Block Argument" do
    arguments = []

    Sample.(3) do |arg|
      arguments << arg
    end

    test "Cycle iteration number is yielded to block" do
      assert(arguments == [0, 1, 2])
    end
  end
end
