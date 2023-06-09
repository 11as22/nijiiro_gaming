require "test_helper"

class Admin::ItemPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_item_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_item_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_item_posts_edit_url
    assert_response :success
  end
end
