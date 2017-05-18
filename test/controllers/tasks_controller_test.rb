require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get day_tasks_url(@day), as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post day_tasks_url(@day), params: { task: { day_id: @task.day_id, finished: @task.finished, name: @task.name } }, as: :json
    end

    assert_response 201
  end

  test "should show task" do
    get day_task_url(@day, @task), as: :json
    assert_response :success
  end

  test "should update task" do
    patch day_task_url(@day, @task), params: { task: { day_id: @task.day_id, finished: @task.finished, name: @task.name } }, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete day_task_url(@day, @task), as: :json
    end

    assert_response 204
  end
end
