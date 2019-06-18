class Book < ApplicationRecord
  belongs_to :author

  def self.ordered_by_author_and_title
    books = []
    Author.all.order(:last_name).each do |author|
      books += author.books.order(:title)
    end
    return books
  end
end
