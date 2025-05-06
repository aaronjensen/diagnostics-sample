require_relative "../automated_init"

context "Measure" do
  context "Garbage Collection" do
    context "Disabled" do
      context "Value Not Given" do
        disabled = nil

        Sample::Measure.() do
          disabled = GC.disable
        end

        test "Garbage collection is disabled" do
          assert(disabled == true)
        end
      end

      context "False" do
        disabled = nil

        Sample::Measure.(gc: false) do
          disabled = GC.disable
        end

        test "Garbage collection is disabled" do
          assert(disabled == true)
        end
      end
    end

    context "Enabled" do
      disabled = nil

      Sample::Measure.(gc: true) do
        disabled = GC.disable
      end

      test "Garbage collection is enabled" do
        assert(disabled == false)
      end
    end
  end
end
