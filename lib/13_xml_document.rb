class XmlDocument
  # TODO: your code goes here!

  def initialize(indent = false)
    @indent = indent
    @indenter = 0
  end

  def method_missing(method, args = {}, &block)
    xml = ''
    xml += "  " * @indenter unless (xml.nil? || !@indent)
    xml += "<#{method}"
    if !args.nil?
      args.each_pair do |k , v|
        xml += " #{k}='#{v}'"
      end
    end
    if block_given?
      xml += ">"
      @indenter += 1
      xml += "\n" if @indent
      xml += yield
      @indenter -= 1
      xml += ("  " * @indenter) if @indent
      xml += "</#{method}>"
      xml += "\n" if @indent
    else
      xml += "/>"
      xml += "\n" if @indent
    end
    return xml
  end

  def send(tagName)
      "<#{tagName}/>"
  end
end
