class Dictionary
  # TODO: your code goes here!
  attr_accessor :entries, :keywords

  def initialize
    @entries = Hash.new
    @keywords = Array.new
  end

  def add(entry)
    if entry.is_a?(Hash)
      @keywords << entry.keys.join(',')
      @keywords.sort!
      entry.each do |k,v|
        @entries[k] = v
      end
    else
      @keywords = [entry]
      @entries[entry] = nil
    end
  end

  def include?(key)
    @keywords.include?(key)
  end

  def find(key)
    @entries.select {|k, v| k[0..key.length-1] == key}
  end

  def printable
    @entries.sort.map{|k,v| "[#{k}] \"#{v}\""}.join("\n")
  end
end
