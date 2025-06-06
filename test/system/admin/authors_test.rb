require "application_system_test_case"

class Admin::AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit admin_authors_url
    assert_selector "h1", text: "Authors"
  end

  test "should create author" do
    visit admin_authors_url
    click_on "New author"

    fill_in "Full name", with: @author.full_name
    fill_in "Short bio", with: @author.short_bio
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "should update Author" do
    visit admin_author_url(@author)
    click_on "Edit this author", match: :first

    fill_in "Full name", with: @author.full_name
    fill_in "Short bio", with: @author.short_bio
    click_on "Update Author"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "should destroy Author" do
    visit admin_author_url(@author)
    click_on "Destroy this author", match: :first

    assert_text "Author was successfully destroyed"
  end
end
