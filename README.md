# diagnostics-sample

Sampling and measurement of execution cycles

## Synopsis

To measure a single execution cycle:

```ruby
result = Diagnostics::Sample.() do
  some_method(...)
end

result.cycle_time_milliseconds
# => 11.1
```

To measure many execution cycles (i.e. iterations):

```ruby
result = Diagnostics::Sample.(1000) do
  some_method(...)
end

# Total elapsted time across all cycles
result.cycle_time_milliseconds
# => 11111.11

# Average elapsted time across all cycles
result.mean_cycle_time_milliseconds
# => 11.1

# Cycles per second
result.cycle_frequency
# => 111.1
```

A number of warmup cycles may be specified:

```ruby
Diagnostics::Sample.(1000, warmup_cycles: 10) do
  some_method(...)
end
```

The garbage collector by default is disabled during the measurement. It can be enabled optionally:

```ruby
Diagnostics::Sample.(1000, gc: true) do
  some_method(...)
end
```

## License

The `diagnostics-sample` library is released under the [MIT License](https://github.com/eventide-project/diagnostics-sample/blob/master/MIT-License.txt).
