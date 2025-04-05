class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to book_path(@book), notice: "Comment added successfully."
    else
      redirect_to book_path(@book), alert: "There was an error adding your comment."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to book_path(@book), notice: "Comment removed successfully."
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
