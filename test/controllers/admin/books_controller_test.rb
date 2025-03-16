require "test_helper"

class Admin::BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get admin_books_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post admin_books_url, params: { book: { author_id: @book.author_id, description: @book.description, genre_id: @book.genre_id, name: @book.name } }
    end

    assert_redirected_to admin_book_url(Book.last)
  end

  test "should show book" do
    get admin_book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch admin_book_url(@book), params: { book: { author_id: @book.author_id, description: @book.description, genre_id: @book.genre_id, name: @book.name } }
    assert_redirected_to admin_book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete admin_book_url(@book)
    end

    assert_redirected_to admin_books_url
  end
end
