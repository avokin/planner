class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]

  # GET /sprints/:sprint_id/goals
  def index
    sprint = Sprint.find(params[:sprint_id])
    render json: sprint.goals
  end

  # GET /goals/1
  def show
    render json: @goal
  end

  # POST /sprints/:sprint_id/goals
  def create
    @goal = Goal.new(goal_params)
    @goal.sprint_id = params[:sprint_id]

    if @goal.save
      render json: @goal, status: :created, only: [:id, :name]
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sprints/:sprint_id/goals/1
  def update
    if @goal.update(goal_params)
      render json: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goal_params
      #ToDo: check sprint_id
      params.require(:goal).permit(:name, :finished, :sprint_id)
    end
end
