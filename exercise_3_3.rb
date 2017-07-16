# Mixing in modules
#[6] Create a method that returns today's date. Method name should be 'current_date'
# This method should be in a module called 'Generic'.
# Try mixing in this module into the Document class
# Now use this method to create another method that returns
# The tite of the document and today's date like below:
# "document_title 2014-06-22". This method should be called 'title_with_date'


#[7] we would like to add a function that replaces a word with another
# replace_word(old_word, new_word)

#Metaprogramming
#[8] instead of calling document.replace_word(old,new) we would like to be able to
# do something like this: document.replace_book('pen') where book is the old word
# and pen is the new word. This should work on any word (not just book).
# hint:  'method_missing'

require 'time'

module Generic
   def Generic.current_date
     "{Time.now.year}-{Time.now.month}-{Time.now.day}"
   end
end


class Document
  attr_accessor :author, :title, :content, :exsec
  def initialize(params = {})
    self.author = params[:author]
    self.title = params[:title]
    self.content = params[:content]
  end
  def title_with_date
    "#{self.title} #{Generic.current_date}"
  end
    def replace_word old_word,  new_word
    self.content.gsub! old_word, new_word
    end
    def method_missing method_name, new_word
        old_word = method_name.to_s.split("_")[-1]
        self.send("replace_word", old_word, new_word)
    end

end


a=Document.new(:author => "someone", :title => "my book", :content => "this is the content of my book")
a.title_with_date
a.replace_word "tests", "test2"
a.replace_content('pen')
