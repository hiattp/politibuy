require 'test_helper'

class PolicyMakersControllerTest < ActionController::TestCase
  setup do
    @policy_maker = policy_makers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:policy_makers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create policy_maker" do
    assert_difference('PolicyMaker.count') do
      post :create, policy_maker: { bio: @policy_maker.bio, first_name: @policy_maker.first_name, home_state: @policy_maker.home_state, last_name: @policy_maker.last_name, party: @policy_maker.party, salutation: @policy_maker.salutation }
    end

    assert_redirected_to policy_maker_path(assigns(:policy_maker))
  end

  test "should show policy_maker" do
    get :show, id: @policy_maker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @policy_maker
    assert_response :success
  end

  test "should update policy_maker" do
    put :update, id: @policy_maker, policy_maker: { bio: @policy_maker.bio, first_name: @policy_maker.first_name, home_state: @policy_maker.home_state, last_name: @policy_maker.last_name, party: @policy_maker.party, salutation: @policy_maker.salutation }
    assert_redirected_to policy_maker_path(assigns(:policy_maker))
  end

  test "should destroy policy_maker" do
    assert_difference('PolicyMaker.count', -1) do
      delete :destroy, id: @policy_maker
    end

    assert_redirected_to policy_makers_path
  end
end
