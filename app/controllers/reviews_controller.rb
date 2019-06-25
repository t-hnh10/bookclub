class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.book_id = params[:book]
  end

  def create
    book = Book.find(params[:review][:book_id])
    @review = book.reviews.new
    @review.user_id = current_user.id
    @review.rating = params[:review][:rating]
    @review.comment = params[:review][:comment]
    if @review.save
      flash[:alert] = "Your review was saved"
    else
      flash[:alert] = "Ooops. There was a problem creating the review."
    end
    redirect_to book_path(book)
  end
end
