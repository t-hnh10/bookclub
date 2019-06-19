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
end
