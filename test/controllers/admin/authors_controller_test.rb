require "test_helper"

class Admin::AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get admin_authors_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_author_url
    assert_response :success
  end

  test "should create author" do
    assert_difference("Author.count") do
      post admin_authors_url, params: { author: { full_name: @author.full_name, short_bio: @author.short_bio } }
    end

    assert_redirected_to admin_author_url(Author.last)
  end

  test "should show author" do
    get admin_author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_author_url(@author)
    assert_response :success
  end

  test "should update author" do
    patch admin_author_url(@author), params: { author: { full_name: @author.full_name, short_bio: @author.short_bio } }
    assert_redirected_to admin_author_url(@author)
  end

  test "should destroy author" do
    assert_difference("Author.count", -1) do
      delete admin_author_url(@author)
    end

    assert_redirected_to admin_authors_url
  end
end
