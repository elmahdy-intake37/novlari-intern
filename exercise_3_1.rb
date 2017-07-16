# [1] Define a Document class that has 3 attributes (author, title, content)
      #add getter and setter methods (hint  - attr_accessor)
      # Initializer function should be like this: initialize(attributes={})

# [2] Add an addition function that returns a new document with the concatenation
# of the caller and passed document content. (title and author should be the caller's)

# hint: 1+3 is actually: 1.+(3)  where + is the function name
# hence if we have Document a and Document b
# calling a + b should return a document (c) with the new content

# [3] modify the function so that we could also do this: a + "abc", which also
# returns a document with the concatenation of of the content of a and "abc"



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
  elsif
    Document.new author: self.author, title: self.title, content: self.content
  end
end




# These examples should work
a=Document.new(:author => "someone", :title => "my book", :content => "this is the content of my book")
b=Document.new(:author => "someone", :title => "my book", :content => "and so is this.")

add_content = a + b
puts add_content.content

add_content2= a + "abcdef"
puts add_content2.content
