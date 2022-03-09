class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home landing]
  before_action :set_challenge, only: %i[members leaderboard]

  def home
  end

  def dashboard
    @my_challenges = []
    @my_user_challenges = UserChallenge.where(user: current_user).order("created_at ASC")
    @my_user_challenges.each do |challenge|
      if Challenge.where(id: challenge.challenge_id)[0].end_date > DateTime.now
        @my_challenges << Challenge.where(id: challenge.challenge_id)
      end
    end
  end

  def landing
  end

  def profile
    @my_current_challenges = []
    @my_user_challenges = UserChallenge.where(user: current_user).order("created_at ASC")
    @my_user_challenges.each do |challenge|
      @my_current_challenges << Challenge.where(id: challenge.challenge_id)[0]
    end
  end

  def history
    @my_challenges = []
    @my_user_challenges = UserChallenge.where(user: current_user).order("created_at ASC")
    @my_user_challenges.each do |challenge|
      if Challenge.where(id: challenge.challenge_id)[0].end_date < DateTime.now
        @my_challenges << Challenge.where(id: challenge.challenge_id)
      end
    end
  end

  def stats
    @challenges = Challenge.where(user: current_user)
    @exercises = Exercise.where(user: current_user)
    @my_past_challenges = []
    @my_current_challenges = []
    @my_user_challenges = UserChallenge.where(user: current_user).order("created_at ASC")
    @my_user_challenges.each do |challenge|
      if Challenge.where(id: challenge.challenge_id)[0].end_date < DateTime.now
        @my_past_challenges << Challenge.where(id: challenge.challenge_id)[0]
      elsif Challenge.where(id: challenge.challenge_id)[0].end_date > DateTime.now
        @my_current_challenges << Challenge.where(id: challenge.challenge_id)[0]
      end
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
