class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    like = @book.likes.new(user_id: current_user.id)
    @book.create_notification_like!(current_user)
    like.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    like = @book.likes.find_by(user_id: current_user.id)
    like.destroy
  end
end
