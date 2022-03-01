class ChallengesController < ApplicationController
    before_action :set_challenge, only: [:edit, :update, :show, :destroy]
    
    def index
        @challenges = Challenge.where(user: current_user)
    end

    def new
        @challenge = Challenge.new
    end
    
    def show
    end
    
    def create
      @challenge = Challenge.new(challenge_params)
      @challenge.user = current_user
        if @challenge.save!
        redirect_to dashboard_path, notice: 'Your challenge has beed added!'
        else 
            render 'challenges/show'
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
    

    private
    def set_challenge 
        @challenge = Challenge.find(params[:id])
    end

    def challenge_params
        params.require(:challenge).permit(:name, :amount, :start_date, :end_date, :code, user: current_user, :private, :exercice_length, :maximum, :points, :rollover)
    end


end
