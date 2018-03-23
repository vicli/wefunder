class MatchesController < ApplicationController
  def index
  end

  def show
    @match = Match.find(params[:id])
    @contestant_1 = Contestant.find(@match.contestant_one_id)
    @contestant_2 = Contestant.find(@match.contestant_two_id)
  end

  def new
    @round = Round.new
  end

  def update
    current_tournament = Tournament.find(params[:tournament_id])

    @match = Match.find(params[:id])
    if @match.update_match(params[:match][:contestant_one_score],params[:match][:contestant_two_score] )
      redirect_to tournament_path(current_tournament)
    end
  end

  def create
    current_tournament = Tournament.find(params[:tournament_id])

    round_number = Round.current_round(current_tournament.id) + 1

    @round = Round.new(tournament_id: current_tournament.id, round_number: round_number )

    if @round.save
      MatchCreationService.new().create_matches_for_round(@round)
      redirect_to tournament_path(current_tournament)

    else
      flash[:notice] = 'Tournament cannot be created'
      render 'new'
    end
  end

  private
  def tournament_params
    params.require(:tournaments).permit(:name, :number_of_contestants)
  end
end
