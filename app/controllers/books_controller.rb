class BooksController < ApplicationController
    def index
        @books = Book.ordered_by_author_and_title
    end

    def show
        @book = Book.find(params[:id])
    end
end
