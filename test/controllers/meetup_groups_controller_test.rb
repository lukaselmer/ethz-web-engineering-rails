require 'test_helper'

class MeetupGroupsControllerTest < ActionController::TestCase
  setup do
    @meetup_group = meetup_groups(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetup_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meetup_group" do
    assert_difference('MeetupGroup.count') do
      post :create, meetup_group: { home_town: @meetup_group.home_town, incepted_at: @meetup_group.incepted_at, owner_id: @meetup_group.owner_id, topic: @meetup_group.topic }
    end

    assert_redirected_to meetup_group_path(assigns(:meetup_group))
  end

  test "should show meetup_group" do
    get :show, id: @meetup_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meetup_group
    assert_response :success
  end

  test "should update meetup_group" do
    patch :update, id: @meetup_group, meetup_group: { home_town: @meetup_group.home_town, incepted_at: @meetup_group.incepted_at, owner_id: @meetup_group.owner_id, topic: @meetup_group.topic }
    assert_redirected_to meetup_group_path(assigns(:meetup_group))
  end

  test "should destroy meetup_group" do
    assert_difference('MeetupGroup.count', -1) do
      delete :destroy, id: @meetup_group
    end

    assert_redirected_to meetup_groups_path
  end
end
