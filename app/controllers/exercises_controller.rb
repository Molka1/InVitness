class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[edit update destroy]
  before_action :set_challenge, only: %i[index edit update]

  def index
    @exercises = Exercise.where(challenge: @challenge).order("created_at DESC")
  end

  def new
    @exercise = Exercise.new
    @my_challenges = []
    @my_user_challenges = UserChallenge.where(user: current_user).order("created_at ASC")
    @my_user_challenges.each do |challenge|
      @my_challenges << Challenge.where(id: challenge.challenge_id)[0]
    end
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
    @exercise.challenge = @challenge
    @exercise.update(exercise_params)
    redirect_to challenge_exercises_path(@exercise.challenge)
  end

  def destroy
    @exercise.destroy
    redirect_to challenge_exercises_path(@exercise.challenge)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :start_time, :end_time, :price, :content, :challenge_id, :photo,
                                     user: current_user)
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
