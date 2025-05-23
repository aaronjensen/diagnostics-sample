ENV["CONSOLE_DEVICE"] ||= "stdout"
ENV["LOG_LEVEL"] ||= "_min"

puts RUBY_DESCRIPTION

require_relative "../init.rb"

require "test_bench"; TestBench.activate

require "pp"

require "diagnostics/sample/controls"

Sample = Diagnostics::Sample
Controls = Diagnostics::Sample::Controls
