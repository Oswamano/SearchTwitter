require 'test_helper'

class TrusteeCompaniesControllerTest < ActionController::TestCase
  setup do
    @trustee_company = trustee_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trustee_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trustee_company" do
    assert_difference('TrusteeCompany.count') do
      post :create, trustee_company: { name: @trustee_company.name }
    end

    assert_redirected_to trustee_company_path(assigns(:trustee_company))
  end

  test "should show trustee_company" do
    get :show, id: @trustee_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trustee_company
    assert_response :success
  end

  test "should update trustee_company" do
    patch :update, id: @trustee_company, trustee_company: { name: @trustee_company.name }
    assert_redirected_to trustee_company_path(assigns(:trustee_company))
  end

  test "should destroy trustee_company" do
    assert_difference('TrusteeCompany.count', -1) do
      delete :destroy, id: @trustee_company
    end

    assert_redirected_to trustee_companies_path
  end
end
