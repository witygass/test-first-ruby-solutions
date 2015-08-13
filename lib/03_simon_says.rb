def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, n=2)
  ((word + " ")*n).strip!
end

def start_of_word(word, n)
  word[0..(n-1)]
end

def first_word(string)
  myWords = string.split(/\s+/)
  myWords[0]
end

def titleize(string)
  x = 0
  string.split.map.with_index{|word, index|
    if (word.length > 3) || (index == 0)
      word[0].upcase + word[1..-1]
    else
      word
    end
  }.join(' ')
end
