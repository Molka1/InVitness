class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[edit update show destroy members leaderboard]

  def index
    @present_challenges = []
    if params[:query].present?
        Challenge.where("name ILIKE ?", "%#{params[:query]}%").each do |challenge|
          if challenge.end_date > DateTime.now
            @present_challenges << challenge
          end
        end
    else
      Challenge.all.order("created_at DESC").each do |challenge|
        if challenge.end_date > DateTime.now
          @present_challenges << challenge
        end
      end
    end
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
      UserChallenge.create(user: current_user, challenge: @challenge)
      Chatroom.create!(name: @challenge.name, challenge: @challenge)
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
    @my_user_challenge = UserChallenge.find_by(user: current_user, challenge: @challenge.id)
    @owner = User.find(@challenge.user_id)

    @users = User.geocoded

    members = @user_challenges.map do |member|
      member.user
    end

    #Geocode and Mapbox

    @markers = members.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string( partial: "info_window", locals: { user: user}),
        image_url: helpers.asset_url("geocoding_marker.png")
      }
    end
  end


  def leaderboard
    @user_challenges = UserChallenge.where(challenge: @challenge.id).order("points DESC")
    @my_user_challenge = UserChallenge.find_by(user: current_user, challenge: @challenge.id)
    @owner = User.find(@challenge.user_id)
    points
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :amount, :start_date, :end_date, :code, :private, :exercise_length,
                                      :maximum, :points, :rollover, :photo, :location)
  end

  def points
    @user_challenge = UserChallenge.where(challenge: @challenge.id)
    @user_challenge.each do |member|
      @user = member.user
      @challenge = member.challenge
      @exercises = Exercise.where(user: @user, challenge: @challenge)
      member.points = @exercises.count
      member.save!
    end
  end
end
