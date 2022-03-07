class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:edit, :update, :show, :destroy, :members, :leaderboard]

  def index
    # @challenges = Challenge.where("name ILIKE ?", "%#{params[:search_query]}%")
    # @challenges = Challenge.where("name ILIKE ?", "%#{params[:search_query]}%")
    if params[:query].present?
      @challenges = Challenge.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @challenges = Challenge.all.order("created_at DESC")
    end
    # else
      # @challenges = Challenge.all.order("created_at DESC")
    # end

    # @my_challenges = Challenge.where(user: current_user)
  end

  def new
    @challenge = Challenge.new
  end

  def show
    @user_challenge = UserChallenge.new
    @my_user_challenge = UserChallenge.find_by(challenge: @challenge, user: current_user)
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    if @challenge.save!
      redirect_to challenge_path(@challenge), notice: 'Your challenge has beed added!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @challenge.update(challenge_params)
    redirect_to challenge_path(@challenge)
  end

  def destroy
    @challenge.destroy
    redirect_to dashboard_path
  end

  def members
    @user_challenges = UserChallenge.where(challenge: @challenge.id)
    @my_user_challenge = UserChallenge.find_by(user: current_user)
    @owner = User.find(@challenge.user_id)
  end

  def leaderboard
    @user_challenges = UserChallenge.where(challenge: @challenge.id)
    @exercises = Exercise.all
    # @exercises = Exercise.where(challenge: @challenge.id)
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :amount, :start_date, :end_date, :code, :private, :exercise_length, :maximum, :points, :rollover, :photo)
  end
end
