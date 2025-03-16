require "test_helper"

class Admin::GenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre = genres(:one)
  end

  test "should get index" do
    get admin_genres_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_genre_url
    assert_response :success
  end

  test "should create admin_genre" do
    assert_difference("Genre.count") do
      post admin_genres_url, params: { genre: { name: @genre.name } }
    end

    assert_redirected_to admin_genre_url(Genre.last)
  end

  test "should show admin_genre" do
    get admin_genre_url(@genre)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_genre_url(@genre)
    assert_response :success
  end

  test "should update admin_genre" do
    patch admin_genre_url(@genre), params: { genre: { name: @genre.name } }
    assert_redirected_to admin_genre_url(@genre)
  end

  test "should destroy admin_genre" do
    assert_difference("Genre.count", -1) do
      delete admin_genre_url(@genre)
    end

    assert_redirected_to admin_genres_url
  end
end
