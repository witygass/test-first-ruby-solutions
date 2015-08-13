def translate(string)
  vow = %w{a e i o u}

  string.split.map do |word|
    if vow.include? word[0]
      word+'ay'
    elsif !word[0..2].downcase.include? 'q'
      sliceTo = 0
      while !vow.include? word[sliceTo] do
        sliceTo += 1
      end
      word[sliceTo..-1]+word[0..(sliceTo-1)]+'ay'
    else
      sliceTo = 0
      #finds the 'q'
      until word[sliceTo] == 'q' do
        sliceTo += 1
      end
      word[(sliceTo+2)..-1]+word[0..(sliceTo+1)]+'ay'
    end
  end.join(' ')
end
