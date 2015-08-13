def measure(n = 1)
  trials = Array.new
    n.times do
      startTime = Time.now
      yield
      finishTime = Time.now
      trial_time = finishTime - startTime
      trials.push(trial_time)
    end
    elapsed_time = trials.inject(:+)/trials.length
end
