class UserChallengesController < ApplicationController
  before_action :set_challenge, only: [:create]

  def create
    @user_challenge = UserChallenge.new(user_challenge_params)
    @user_challenge.user = current_user
    @user_challenge.challenge = @challenge
    if @user_challenge.save!
      redirect_to challenge_path(@challenge), notice: 'You have joined this challenge!'
    else
      render 'challenges/show'
    end
  end

  def destroy
    @user_challenge = UserChallenge.find(params[:id])
    @user_challenge.destroy
    redirect_to dashboard_path
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def user_challenge_params
    params.require(:user_challenge).permit(challenge: set_challenge, user: current_user)
  end
end
