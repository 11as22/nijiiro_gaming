require "test_helper"

class Public::ItemFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_item_favorites_index_url
    assert_response :success
  end
end
