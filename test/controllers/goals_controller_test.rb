require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goal = goals(:one)
    @sprint = sprints(:one)
  end

  test "should get index" do
    get sprint_goals_url(@sprint), as: :json
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post sprint_goals_url(@sprint), params: { goal: { finished: @goal.finished, name: @goal.name, sprint_id: @goal.sprint_id } }, as: :json
    end

    assert_response 201
  end

  test "should show goal" do
    get sprint_goals_url(@sprint, @goal), as: :json
    assert_response :success
  end

  test "should update goal" do
    patch sprint_goal_url(@sprint, @goal), params: { goal: { finished: @goal.finished, name: @goal.name, sprint_id: @goal.sprint_id } }, as: :json
    assert_response 200
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete sprint_goal_url(@sprint, @goal), as: :json
    end

    assert_response 204
  end
end
