class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to book_path(@book), notice: "Комментарий успешно добавлен."
    else
      redirect_to book_path(@book), alert: "Возникла ошибка при добавлении комментария."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to book_path(@book), notice: "Комментарий успешно удален."
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
