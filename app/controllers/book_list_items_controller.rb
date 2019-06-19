class BookListItemsController < ApplicationController
    def index
        @books = BookListItem.books_for_current_user(current_user)
    end
end
