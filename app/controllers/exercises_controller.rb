class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update, :destroy]
  before_action :set_challenge, only: [:index, :edit, :update]

  def index
    @exercises = Exercise.where(challenge: @challenge)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    @exercise.challenge = Challenge.find(params[:exercise][:challenge_id])
    if @exercise.save!
      redirect_to challenge_exercises_path(@exercise.challenge)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @exercise.update(exercise_params)
    redirect_to challenge_exercises_path
  end

  def destroy
    @exercise.destroy
    redirect_to challenge_exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :start_time, :end_time, :price, :content, :challenge_id, user: current_user)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end


    def start_time
      exercise.update(start_time: Time.now)
    end

   def stop_time
    exercise.update(stop_time: Time.now)
   end
end
