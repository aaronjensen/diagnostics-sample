_ = Sample.(...)

Recorder::Null <- default
  - Explicit null impl
  - Naught
Recorder::PG
  - Messaging::Postgres::Writer
Recorder::Telemetry
  - Messaging::Postgres::Writer::Substitute

Sample.(recorder=nil)

def Sample.call(cycles=nil, warmup_cycles: nil, recorder: nil, gc: true, &action)
  cycles ||= Defaults.cycles # 1
  warmup_cycles ||= Defaults.warmup_cycles # 0
  recorder ||= Defaults.recorder # Recorder::Null.build

  # ...

  Measure.(&action)
end

result = Sample.(10) do
  some_stuff
end

x = Sample.(10, warmup_cycles: 10) do
  some_stuff
end

x = Sample.(10, warmup_cycles: 10, recorder: pg_recorder, gc: false) do
  some_stuff
end


class Result
  attribute :cycles
  attribute :warmup_cycles
  attribute :time
  attribute :warmup_time

  def print
  end
end
