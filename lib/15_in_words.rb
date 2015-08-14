module MyWordMethods
  def in_words
    #this method is only to setup the variables used by 'wordify'
    num = self
    #defining word arrays to assign to number values
    mapUnderTwenty = %w(zero one two three four five six seven eight nine ten
    eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    @@mapOnes = mapUnderTwenty[0..9]
    @@mapTeens = mapUnderTwenty[10..19]
    @@mapTens = %w(x x twenty thirty forty fifty sixty seventy eighty ninety)
    @@mapHundred = 'hundred'
    @@mapMagnitudes = %w(thousand million billion trillion)
    #digits of fixnum in array
    digs = num.to_s.split('').map{|x| x.to_i}
    #adds 0's to front of digits until length is a multiple of 3 for recursion
    until digs.length % 3 == 0 do
      digs.unshift(0)
    end
    digs = digs.each_slice(3).to_a
    #gives easy answers to anything under 20, else calls 'wordify' for work
    if num < 20
      mapUnderTwenty[num]
    else
      grouping = 0
      wordify(digs, grouping)
    end
  end

  def wordify(digits, groupno)
    num_words = ""
    loopno = 0
    teens = false
    digits[groupno].each do |x|
      if loopno == 0 && x != 0
        num_words += @@mapOnes[x] + " " + @@mapHundred + " "
      elsif loopno == 1 && x > 1
        num_words += @@mapTens[x] + " "
      elsif loopno == 1 && x == 1
        #sets up exception case for teens (10-19), which rely on both tens and ones digits
        teens = true
      elsif loopno == 2 && teens == true
        num_words += @@mapTeens[x] + " "
      elsif loopno == 2 && x != 0
        num_words += @@mapOnes[x] + " "
      end
      loopno += 1
    end
    if groupno < digits.length-1 && digits[groupno]!=[0,0,0]
      num_words += @@mapMagnitudes[(digits.length - (groupno+2))] + " "
    end
    groupno += 1
    num_words += wordify(digits, groupno) unless groupno >= digits.length
    return num_words.strip
  end
end


class Fixnum
  include MyWordMethods
end
