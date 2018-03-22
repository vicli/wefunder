class RoundsController < ApplicationController
  def index
  end

  def new
    @round = Round.new
  end

  def create

    @round = Round.new(tournament_id: )
    if @round.save
      MatchCreationService.create_match_for_round(@round)
    if @tournament.save
      setup_tournament(@tournament)
      redirect_to new_contestant_path(tournament_id: @tournament.id, number_of_contestants: params[:tournaments][:number_of_contestants])
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
