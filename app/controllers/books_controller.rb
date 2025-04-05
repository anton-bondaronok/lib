class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  helper_method :search_params

  def index
    @tags = Tag.order(:name)
    @genres = Genre.order(:name)
    @authors = Author.order(:full_name)

    @books = ::Books::SearchQuery.new(**search_params).call
    @pagy, @books = pagy(@books, limit: 9)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @book = Book.find(params[:id])

    @related_by_author = Book.where(author_id: @book.author_id).where.not(id: @book.id).limit(4)
    @related_by_genre = Book.where(genre_id: @book.genre_id).where.not(id: @book.id).limit(4)
  end

  private

  def search_params
    @search_params ||= params.permit(:query, :tag_id, :genre_id, :author_id).to_h.symbolize_keys
  end
end
