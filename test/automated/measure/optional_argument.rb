require_relative '../automated_init'

context "Measure" do
  context "Optional Argument" do
    argument = nil

    measure = Sample::Measure.build do |arg|
      argument = arg
    end

    measure.('some-value')

    test "Argument is passed to action" do
      assert(argument == 'some-value')
    end
  end
end
