#[4] Continue in the Document class.
# add a 'words' function that returns the content of the document in the form of
# an array of words.
# Example: if content is "some more content here" then the function should return
# ["some", "more", "content", "here"]

#[5] Read about blocks in ruby [also check the ruby examples provided]
# add a function each_word that loops on the words in the document - you must use
# blocks
# This function is called like this:
# document.each_word do |word|
#  puts word
# end


class Document
  attr_accessor :author, :title, :content, :exsec
  def initialize(params = {})
    self.author = params[:author]
    self.title = params[:title]
    self.content = params[:content]
  end
    def +(exsec)
      if exsec.is_a? String
        Document.new author: self.author, title: self.title, content: self.content + exsec
      else
        Document.new author: self.author, title: self.title, content: self.content + exsec+content
      end
    end
    def words
      @content.split(" ")
    end
    def each_word
      self.each_word do | word |
        yield word
    end
  end
end



a=Document.new(:author => "someone", :title => "my book", :content => "this is the content of my book")
a.words
a.each_word do | word |
 puts word
end
