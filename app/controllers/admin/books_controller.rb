class Admin::BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /admin/books
  def index
    @books = Book.all.includes(:genre, :author, avatar_attachment: :blob).load
  end

  # GET /admin/books/1
  def show
  end

  # GET /admin/books/new
  def new
    @book = Book.new
  end

  # GET /admin/books/1/edit
  def edit
  end

  # POST /admin/books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to [ :admin, @book ], notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/books/1
  def update
    if @book.update(book_params)
      redirect_to [ :admin, @book ], notice: "Book was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/books/1
  def destroy
    @book.destroy!
    redirect_to admin_books_url, notice: "Book was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :description, :avatar, :genre_id, :author_id, book_tags_attributes: [ :id, :tag_id, :_destroy ])
    end
end
