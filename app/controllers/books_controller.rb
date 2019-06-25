class BooksController < ApplicationController
    def index
        @books = Book.ordered_by_author_and_title
    end

    def show
        @book = Book.find(params[:id])
        @can_add = !BookListItem.contains?(current_user,@book) if user_signed_in?
        @reviews = @book.reviews
        @rating = Review.get_average_rating(@book)
    end

    def new
        @book = Book.new
    end

    def create
        author = Author.create_author(params[:book][:first_name], params[:book][:last_name])
        book = Book.create_book(params[:book][:title], author, params[:book][:genre])
        BookListItem.create_book_list_item(current_user, book)
    rescue
        flash[:alert] = "Ooops! There was a problem adding that book"
    ensure
        redirect_to book_list_items_path
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
