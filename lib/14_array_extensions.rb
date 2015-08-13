class Array
  def sum
    if self == []
      0
    else
    self.inject(:+)
    end
  end

  def square
    if self == []
      self
    else
      newArray = self.map{|num| num**2}
    end
  end

  def square!
    if self == []
      self
    else
      return self.map!{|num| num**2}
    end
  end
end
