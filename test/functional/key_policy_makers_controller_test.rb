require 'test_helper'

class KeyPolicyMakersControllerTest < ActionController::TestCase
  setup do
    @key_policy_maker = key_policy_makers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:key_policy_makers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key_policy_maker" do
    assert_difference('KeyPolicyMaker.count') do
      post :create, key_policy_maker: { reason: @key_policy_maker.reason }
    end

    assert_redirected_to key_policy_maker_path(assigns(:key_policy_maker))
  end

  test "should show key_policy_maker" do
    get :show, id: @key_policy_maker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @key_policy_maker
    assert_response :success
  end

  test "should update key_policy_maker" do
    put :update, id: @key_policy_maker, key_policy_maker: { reason: @key_policy_maker.reason }
    assert_redirected_to key_policy_maker_path(assigns(:key_policy_maker))
  end

  test "should destroy key_policy_maker" do
    assert_difference('KeyPolicyMaker.count', -1) do
      delete :destroy, id: @key_policy_maker
    end

    assert_redirected_to key_policy_makers_path
  end
end
