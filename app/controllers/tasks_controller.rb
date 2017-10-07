class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /days/:day_id/tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /days/:day_id/tasks/1
  def show
    render json: @task
  end

  # POST /days/:day_id/tasks
  def create
    @task = Task.new(task_params)
    @task.day_id = params[:day_id]

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /days/:day_id/tasks/1
  def update
    if @task.update_and_create_day_if_needed(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # GET /days/:day_id/overdue_tasks
  def overdue
    day_id = Integer(params[:day_id])
    render json: Task.where(['"day_id" < :day_id and ("finished" = :finished or "finished" is null)', {:day_id => day_id, :finished => false}])
  end

  # DELETE /days/:day_id/tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :finished, :day_id)
    end
end
