class RPNCalculator
  # TODO: your code goes here!
  attr_accessor :value, :nums, :agg

  def initialize
    @nums = Array.new
    @agg = Array.new
  end

  def tokens(str)
    ops = ["+","-","*","/"]
    tokens = str.split.map do |x|
      if ops.include? x
        x.to_sym
      else
        x.to_i
      end
    end
    tokens
  end

  def clear
    @nums = []
    @agg = []
    @value = nil
  end

  def evaluate(str)
    self.clear
    tokens(str).each do |x|
      if x == :*
        self.times
      elsif x == :/
        self.divide
      elsif x == :+
        self.plus
      elsif x == :-
        self.minus
      else
        self.push(x)
      end
    end
    self.value
  end

  def push(num)
    @nums.push(num)
  end

  def plus
    if @nums.length == 0
      raise 'calculator is empty'
    else
      @agg = @nums.pop(2)
      @agg.flatten!
      @value = @agg.inject(:+)
    end
    @nums = [] if @nums.nil?
    @nums << @value
  end

  def minus
    if @nums.length == 0
      raise 'calculator is empty'
    else
      @agg = @nums.pop(2)
      @agg.flatten!
      @value = @agg.inject(:-)
    end
    @nums = [] if @nums.nil?
    @nums << @value
  end

  def divide
    if @nums.length == 0
      raise 'calculator is empty'
    else
      @agg = @nums.pop(2)
      @agg.flatten!
      @value = @agg.inject() { |result, element| result.to_f / element }
    end
    @nums = [] if @nums.nil?
    @nums << @value
  end

  def times
    if @nums.length == 0
      raise 'calculator is empty'
    else
      @agg = @nums.pop(2)
      @agg.flatten!
      @value = @agg.inject() { |result, element| result.to_f * element }
    end
    @nums = [] if @nums.nil?
    @nums << @value
  end
end
