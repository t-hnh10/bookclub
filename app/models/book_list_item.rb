class BookListItem < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.books_for_current_user(current_user)
    return current_user.books
    # return BookListItem.where(user_id: current_user.id).order(:updated_at)
  end
end
