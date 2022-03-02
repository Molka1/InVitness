class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
  end

  def landing
  end

  def leaderboard
  end

  def members
  end

  def profile
  end

  def history
  end

  def stats
  end
end
