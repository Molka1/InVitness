class ChallengesController < ApplicationController
    before_action :set_challenge, only: [:edit, :update, :destroy]

    def index
        @challenges = Challenge.where(user: current_user)
    end

    def new
        @challenge = Challenge.new
    end

    def create
        @challenge = Challenge.new(challenge_params)
        @challenge.user = current_user
    #  if @challenge.save!
    #     redirect_to
    #  else
    #     render 'challenges/'
    end

    private
    def set_challenge
        @challenge = Challenge.find(params[:challenge_id])
    end

    def challenge_params
        params.require(:challenge).permit(:name, :amount, :start_date, :end_date, :code, :user_id, :private, :exercice_length, :maximum, :points, :rollover)
    end


end
