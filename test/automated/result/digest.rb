require_relative "../automated_init"

context "Result" do
  context "Digest" do
    result = Controls::Result.example

    test do
      assert(result.digest == Controls::Result::Digest.example)
    end

    test "to_s" do
      assert(result.to_s == Controls::Result::Digest.example)
    end
  end
end
