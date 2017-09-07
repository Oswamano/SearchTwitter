require 'test_helper'

class NewspapersControllerTest < ActionController::TestCase
  setup do
    @newspaper = newspapers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newspapers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newspaper" do
    assert_difference('Newspaper.count') do
      post :create, newspaper: { city: @newspaper.city, county: @newspaper.county, days_prior: @newspaper.days_prior, name: @newspaper.name, publishes_friday: @newspaper.publishes_friday, publishes_monday: @newspaper.publishes_monday, publishes_saturday: @newspaper.publishes_saturday, publishes_sunday: @newspaper.publishes_sunday, publishes_thursday: @newspaper.publishes_thursday, publishes_tuesday: @newspaper.publishes_tuesday, publishes_wednesday: @newspaper.publishes_wednesday, state: @newspaper.state, time: @newspaper.time }
    end

    assert_redirected_to newspaper_path(assigns(:newspaper))
  end

  test "should show newspaper" do
    get :show, id: @newspaper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newspaper
    assert_response :success
  end

  test "should update newspaper" do
    patch :update, id: @newspaper, newspaper: { city: @newspaper.city, county: @newspaper.county, days_prior: @newspaper.days_prior, name: @newspaper.name, publishes_friday: @newspaper.publishes_friday, publishes_monday: @newspaper.publishes_monday, publishes_saturday: @newspaper.publishes_saturday, publishes_sunday: @newspaper.publishes_sunday, publishes_thursday: @newspaper.publishes_thursday, publishes_tuesday: @newspaper.publishes_tuesday, publishes_wednesday: @newspaper.publishes_wednesday, state: @newspaper.state, time: @newspaper.time }
    assert_redirected_to newspaper_path(assigns(:newspaper))
  end

  test "should destroy newspaper" do
    assert_difference('Newspaper.count', -1) do
      delete :destroy, id: @newspaper
    end

    assert_redirected_to newspapers_path
  end
end
