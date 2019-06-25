class BooksController < ApplicationController
    def index
        @books = Book.ordered_by_author_and_title
    end

    def show
        @book = Book.find(params[:id])
        @can_add = !BookListItem.contains?(current_user,@book) if user_signed_in?
    end

    def new
        @book = Book.new
    end

    def add
        book = Book.find(params[:id])

        if BookListItem.contains?(current_user, book)
            flash[:alert] = "Sorry, that book is already in your list"
            redirect_to book_path(book.id)
        else
            current_user.books.push(book)
            if current_user.save
                flash[:alert] = "We have added #{book.title} in your list."
                redirect_to book_list_items_path
            else
                flash[:alert] = "Oops! There was a problem adding that book"
            end
        end
    end
end
