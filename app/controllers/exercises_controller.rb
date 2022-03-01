class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update, :destroy]
  before_action :set_challenge, only: [:index, :new, :create]

  def index
    @exercises = Booking.where(challenge: @challenge)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    @exercise.challenge = @challenge
    if @exercise.save!
      redirect_to challenge_exercise_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @exercise.update(exercise_params)
    redirect_to challenge_exercise_index_path
  end

  def destroy
    @exercise.destroy
    redirect_to challenge_exercise_index_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :start_time, :end_time, :price, :content, user: current_user)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end
end
