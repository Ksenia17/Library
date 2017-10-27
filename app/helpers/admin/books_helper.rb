module Admin::BooksHelper
  def options_select_new
   # @book.name
    @book_type_options = BookType.all.collect{|p| [ p.name,p.id]}
  end
end
