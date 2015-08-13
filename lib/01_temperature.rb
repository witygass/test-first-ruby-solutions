def ftoc(num)
  n = (num - 32)*(5.0/9)
  n.floor
end

def ctof(num)
  n = (num * 9/5.0) + 32
end
