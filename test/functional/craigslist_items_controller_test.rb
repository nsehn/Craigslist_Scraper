require 'test_helper'

class CraigslistItemsControllerTest < ActionController::TestCase
  setup do
    @craigslist_item = craigslist_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:craigslist_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create craigslist_item" do
    assert_difference('CraigslistItem.count') do
      post :create, craigslist_item: { category: @craigslist_item.category, location: @craigslist_item.location, price: @craigslist_item.price, title: @craigslist_item.title, url: @craigslist_item.url }
    end

    assert_redirected_to craigslist_item_path(assigns(:craigslist_item))
  end

  test "should show craigslist_item" do
    get :show, id: @craigslist_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @craigslist_item
    assert_response :success
  end

  test "should update craigslist_item" do
    put :update, id: @craigslist_item, craigslist_item: { category: @craigslist_item.category, location: @craigslist_item.location, price: @craigslist_item.price, title: @craigslist_item.title, url: @craigslist_item.url }
    assert_redirected_to craigslist_item_path(assigns(:craigslist_item))
  end

  test "should destroy craigslist_item" do
    assert_difference('CraigslistItem.count', -1) do
      delete :destroy, id: @craigslist_item
    end

    assert_redirected_to craigslist_items_path
  end
end
