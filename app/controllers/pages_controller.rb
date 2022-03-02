class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]
  before_action :set_challenge, only: [:members, :leaderboard]

  def home
  end

  def dashboard
  end

  def landing
  end

  # def leaderboard
  # end

  # def members
  # end

  def profile
  end

  def history
  end

  def stats
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
