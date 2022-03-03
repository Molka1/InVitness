class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:edit, :update, :show, :destroy, :members, :leaderboard]

  def index
    # @challenges = Challenge.where("name ILIKE ?", "%#{params[:search_query]}%")
    # @challenges = Challenge.where("name ILIKE ?", "%#{params[:search_query]}%")
    # if params[:search][:query].nil?
    #   @challenges = Challenge.where("name ILIKE ?", "%#{params[:search][:query]}%")
    # else
      @challenges = Challenge.all.order("created_at DESC")
    # end

    # @my_challenges = Challenge.where(user: current_user)
  end

  def new
    @challenge = Challenge.new
  end

  def show
    @user_challenge = UserChallenge.new
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
  end

  def leaderboard
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :amount, :start_date, :end_date, :code, :private, :exercise_length, :maximum, :points, :rollover, user: current_user)
  end
end
