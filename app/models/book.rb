class Book < ApplicationRecord
  belongs_to :author
  has_many :book_list_items

  def self.ordered_by_author_and_title
    books = []
    Author.all.order(:last_name).each do |author|
      books += author.books.order(:title)
    end
    return books
  end

  def self.find_book(title, author_last_name)
    book = nil
    books = Book.where("LOWER(title) = ?", title.downcase.strip)
    if (books)
      book = books.first
      if (book && book.author.last_name.downcase != author_last_name.downcase.strip)
        book = nil
      end
    end
    return book
  end

  def self.create_book(title, author, genre)
    book = Book.find_book(title, author.last_name)
    if(!book)
      book = Book.new(title: title, genre: genre, author_id: author.id)
    end
    return book
  end

  def create
    author = Author.create_author(params[:book][:first_name], params[:book][:last_name])
    book = Book.create_book(params[:book][:title], author, params[:book][:genre])
    BookListItem.create_book_list_item(current_user, book)
    rescue
      flash[:alert] = "Oops! There was a problem adding that book."
    ensure
      redirect_to book_list_items_path
  end
end
