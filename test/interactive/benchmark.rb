require_relative './interactive_init'

fibonacci = proc { |n|
  if [0, 1].include?(n)
    1
  else
    fibonacci.(n - 2) + fibonacci.(n - 1)
  end
}

result = Diagnostics::Sample.(1000) do
  fibonacci.(10)
end

puts <<~TEXT % [result.cycles, result.mean_cycle_time_milliseconds]

= = =

Cycles: %d
Average Cycle Time: %0.2fms
TEXT
