class Temperature
  # TODO: your code goes here!
  def self.from_celsius(temp)
    self.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    self.new(:f => temp)
  end

  def initialize(scaleValue)
    @scaleValue = scaleValue
    @scale = @scaleValue.keys[0]
    @temp = @scaleValue.values[0]
  end

  def in_celsius
    if @scale == :c
      @temp
    else
      (@temp - 32)*(5.0/9.0)
    end
  end

  def in_fahrenheit
    if @scale == :f
      @temp
    else
      (@temp * 9.0/5.0) + 32
    end
  end
end

class Celsius < Temperature
  def initialize(temp)
    @scale = :c
    @temp = temp
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    @scale = :f
    @temp = temp
  end
end
