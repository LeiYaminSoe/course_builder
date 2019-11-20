require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def sign_in(user)
    post user_session_path \
      "leiyaminsoe@gmail.com"    => user.email,
      "Y@min13051987" => user.password
  end

  setup do
    @lei = users(:lei)
    @lei.created_at = '2019-11-20 17:14:01.658998'
    sign_in(@lei)
    @chapter = chapters(:one)
  end

  test "should get index" do
    get chapters_url
    assert_response :success
  end

  test "should get new" do
    get new_chapter_url
    assert_response :success
  end

  test "should create chapter" do
    assert_difference('Chapter.count') do
      post chapters_url, params: { chapter: {  } }
    end

    assert_redirected_to chapter_url(Chapter.last)
  end

  test "should show chapter" do
    get chapter_url(@chapter)
    assert_response :success
  end

  test "should get edit" do
    get edit_chapter_url(@chapter)
    assert_response :success
  end

  test "should update chapter" do
    patch chapter_url(@chapter), params: { chapter: {  } }
    assert_redirected_to chapter_url(@chapter)
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete chapter_url(@chapter)
    end

    assert_redirected_to chapters_url
  end
end
