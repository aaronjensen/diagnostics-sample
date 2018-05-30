require_relative './interactive_init'

measurement_subject = proc {
  sleep 0.01
}

result = Diagnostics::Sample.(300) do
  measurement_subject.()
end

puts
puts "= = ="
puts
puts result
