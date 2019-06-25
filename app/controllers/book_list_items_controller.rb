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
end
