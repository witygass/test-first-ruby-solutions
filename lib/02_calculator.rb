def add(x,y)
  x+y
end

def sum(array)
  array == []? 0: array.inject(:+)
end

def subtract(x, y)
  x-y
end

def multiply(*args)
  n = 1
  args.each do |num|
    n *= num
  end
  n
end


def power(x, y)
  x**y
end

def factorial(num)
  if [0,1].include? num
    num = 1
  else
    x = num
    (num-1).times do
      x-=1
      num*=x
    end
  end
  num
end
