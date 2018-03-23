class RoundsController < ApplicationController
  def index
  end

  def new
    @round = Round.new
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

  def finish
    current_tournament = Tournament.find(params[:tournament_id])

    @round = Round.find(params[:id])

    if @round.conclude_round
      redirect_to tournament_path(current_tournament)
    else
      flash[:notice] = 'Cannot conclude round'
    end
  end

  private
  def tournament_params
    params.require(:tournaments).permit(:name, :number_of_contestants)
  end
end
