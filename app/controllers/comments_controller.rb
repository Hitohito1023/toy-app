class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    if @comment.save
      @book.create_notification_comment!(current_user, @comment.id)
      redirect_to request.referer
    else
      render "books/show"
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = @book.comments.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
