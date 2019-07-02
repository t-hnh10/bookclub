class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.following.push(user)

    if current_user.save
      flash[:alert] = "You are now following #{user.name}"
      redirect_to books_path
    end
  end
end
