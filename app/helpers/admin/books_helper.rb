module Admin::BooksHelper
  def options_select_new
    BookType.all.collect{|p| [ p.name,p.id]}
  end
end
