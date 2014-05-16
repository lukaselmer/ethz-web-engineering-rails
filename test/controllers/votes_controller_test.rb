require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
    sign_in users(:one)
  end

  test "should create vote" do
    @vote.destroy
    assert_difference('Vote.count') do
      post :create, vote: {activity_id: @vote.activity_id, user_id: @vote.user_id}
    end

    assert_redirected_to activity_path(assigns(:vote).activity)
  end

  test "should not create vote unless in meetup group" do
    @vote.destroy
    user = @vote.user
    user.meetup_groups = []
    user.save

    assert_no_difference('Vote.count') do
      assert_raises(CanCan::AccessDenied) do
        post :create, vote: {activity_id: @vote.activity_id, user_id: user.id}
      end
    end
  end

  test "should not create double vote" do
    assert_no_difference('Vote.count') do
      post :create, vote: {activity_id: @vote.activity_id, user_id: @vote.user_id}
    end

    assert_redirected_to activity_path(assigns(:vote).activity)
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote
    end

    assert_redirected_to activity_path(assigns(:vote).activity)
  end
end
