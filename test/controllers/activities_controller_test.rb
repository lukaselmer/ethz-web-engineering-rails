require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should get new" do
    get :new, activity: {meetup_group_id: @activity.meetup_group_id}
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, activity: {definite: @activity.definite, description: @activity.description, duration: @activity.duration, location: @activity.location, meetup_group_id: @activity.meetup_group_id, name: @activity.name, start_at: @activity.start_at}
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should show activity" do
    get :show, id: @activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity
    assert_response :success
  end

  test "should update activity" do
    patch :update, id: @activity, activity: {definite: @activity.definite, description: @activity.description, duration: @activity.duration, location: @activity.location, meetup_group_id: @activity.meetup_group_id, name: @activity.name, start_at: @activity.start_at}
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @activity
    end

    assert_redirected_to meetup_group_path(assigns(:activity).meetup_group)
  end
end
