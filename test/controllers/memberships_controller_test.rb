require 'test_helper'

class MembershipsControllerTest < ActionController::TestCase
  setup do
    @membership = memberships(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get :new, membership: {meetup_group_id: @membership.meetup_group_id}
    assert_response :success
  end

  test "should create membership" do
    assert_difference('Membership.count') do
      post :create, membership: {meetup_group_id: @membership.meetup_group_id, user_id: @membership.user_id}
    end

    assert_redirected_to meetup_group_path(assigns(:membership).meetup_group)
  end

  test "should destroy membership" do
    assert_difference('Membership.count', -1) do
      delete :destroy, id: @membership
    end

    assert_redirected_to meetup_group_path(assigns(:membership).meetup_group)
  end
end
