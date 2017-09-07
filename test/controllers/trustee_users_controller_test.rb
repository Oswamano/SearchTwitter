require 'test_helper'

class TrusteeUsersControllerTest < ActionController::TestCase
  setup do
    @trustee_user = trustee_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trustee_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trustee_user" do
    assert_difference('TrusteeUser.count') do
      post :create, trustee_user: {  }
    end

    assert_redirected_to trustee_user_path(assigns(:trustee_user))
  end

  test "should show trustee_user" do
    get :show, id: @trustee_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trustee_user
    assert_response :success
  end

  test "should update trustee_user" do
    patch :update, id: @trustee_user, trustee_user: {  }
    assert_redirected_to trustee_user_path(assigns(:trustee_user))
  end

  test "should destroy trustee_user" do
    assert_difference('TrusteeUser.count', -1) do
      delete :destroy, id: @trustee_user
    end

    assert_redirected_to trustee_users_path
  end
end
