class DaysController < ApplicationController
  before_action :set_day, only: [:show, :update, :destroy]

  # GET /days
  def index
    @days = Day.all

    render json: @days
  end

  # GET /days/1
  def show
    sprint = Sprint.where(['"from" <= :day_id and :day_id <= "to"', {:day_id => @day.id}]).first
    sprint_id = sprint.nil? ? nil : sprint.id
    sprint_field = {sprint_id: sprint_id}

    day_data = JSON::parse(@day.to_json(:include => [:tasks])).merge(sprint_field)
    render json: day_data
  end

  # POST /days
  def create
    @day = Day.new(day_params)

    if @day.save
      render json: @day, status: :created, location: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /days/1
  def update
    if @day.update(day_params)
      render json: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  # DELETE /days/1
  def destroy
    @day.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find_by_id(params[:id])
      if @day.nil?
        @day = Day.new(:id => params[:id])
        @day.save!
      end
    end

    # Only allow a trusted parameter "white list" through.
    def day_params
      params.require(:day).permit(:number, :notes)
    end
end
