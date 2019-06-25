class BookListItem < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.books_for_current_user(current_user)
    return current_user.books
    # return BookListItem.where(user_id: current_user.id).order(:updated_at)
  end

  def self.contains?(current_user, book)
    return current_user.books.where(id: book.id).length > 0
  end

  def self.create_book_list_item(current_user,book)
    if (current_user.books.where(id: book.id).length == 0)
      current_user.books.push(book)
      current_user.save
    end
  end
 
  def self.book_list_item_id(current_user,book)
    return BookListItem.where("book_id = ? AND user_id = ?", book,current_user.id).first.id
  end
end
