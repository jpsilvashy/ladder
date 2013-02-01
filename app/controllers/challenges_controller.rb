class ChallengesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_tournament_and_defender, :only => [:new, :create]

  def index
    @challenging = Challenge.where(:challenger_id => current_user.id)
    @defending = Challenge.where(:defender_id => current_user.id)
  end

  def new
    @challenge = @tournament.challenges.build(:challenger => current_user, :defender => @defender)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def create
    @challenge = @tournament.challenges.build(params.require(:challenge).permit(:message))
    @challenge.challenger = current_user
    @challenge.defender = @defender
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      render :new
    end
  end

  private

  def find_tournament_and_defender
    @tournament = Tournament.participant(current_user).find(params[:tournament_id])
    @defender = @tournament.users.find(params[:defender_id])
  end
end
