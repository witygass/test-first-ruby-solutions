class Timer
  def seconds(seconds = 0)
    @seconds = seconds
  end

  def seconds=(seconds)
    @hours = (seconds/3600).padIt
    @minutes = ((seconds/60) % 60).padIt
    @seconds = (seconds % 60).padIt
  end

  def time_string
    "#{@hours}:#{@minutes}:#{@seconds}"
  end
end

class Fixnum
  def padIt
    self.floor.to_s.rjust(2, '0')
  end
end
