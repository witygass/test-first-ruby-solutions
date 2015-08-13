class Book
  # TODO: your code goes here!
  def title
    @title
  end

  def title=(title)
    stopWords = %w(and in the of a an)
    @title = titleize(title, stopWords)
  end

  private
  def titleize(titleName, stopWords)
    titleName.split.each_with_index.map{|x, ind|
      if !stopWords.include?(x) || ind == 0
        x.capitalize
      else
        x
      end
    }.join(' ')
  end
end
