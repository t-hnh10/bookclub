class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    def name
        return "#{first_name} #{last_name}"        
    end

    def self.ordered_by_last_name
        return Author.order(:last_name)
    end

    def books_ordered_by_title
        return books.order(:title)
    end
end
