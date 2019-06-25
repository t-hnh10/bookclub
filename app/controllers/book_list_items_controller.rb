class BookListItemsController < ApplicationController
    before_action :authenticate_user!
    def index
        @books = current_user.books
    end

    def destroy
        item_id = BookListItem.book_list_item_id(current_user,params[:id])
        BookListItem.destroy(item_id)
        redirect_to book_list_items_path
    end

    # def destroy
    #     # .where returns an array (even with only one result) hence we use .first
    #     BookListItem.where(book_id: params[:book_id], user_id: current_user.id).first.destroy
    #     redirect_to book_list_items_path
    # end

    def edit
        @book_list_item = BookListItem.find(BookListItem.book_list_item_id(current_user,params[:id]))
    end

    def update
        book_list_item = BookListItem.find(params[:id])
        available_for_trade = params[:book_list_item][:for_trade]

        # If available_for_trade is "1" set for_trade = true
        if available_for_trade = "1"
            book_list_item.for_trade = true
        else
        # but if available_for_trade is "0" set for_trade = false
            book_list_item.for_trade = false
        end

        if book_list_item.save
            flash[:alert] = "Your changes have been saved"
        else
            flash[:alert] = "There was an error saving your changes"
        end

        redirect_to book_path(book_list_item.book.id)
    end
end
