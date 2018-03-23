class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.where(active: true)
  end
  def show
    @tournament = Tournament.find(params[:id])
    if @tournament
      @has_generated_contestants = TournamentContestantStat.where(tournament_id: @tournament.id).count >0
      @contestants = Contestant.active_contestants_for_tournament(@tournament.id)
      @current_round = Round.current_round(@tournament.id)
      @winner = Contestant.check_winner_for_tournament(@tournament.id)
    end
  end
  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params.except(:number_of_contestants))
    if @tournament.save
      setup_tournament(@tournament)
      redirect_to new_tournament_contestant_path(tournament_id: @tournament.id, number_of_contestants: params[:tournaments][:number_of_contestants])
    else
      flash[:notice] = 'Tournament cannot be created'
      render 'new'
    end
  end

  def destroy
    @tournament = current_tournament
    Tournament.reset_tournament(@tournament.id)

    @tournament.update_attributes(active: false)
    delete_tournament

    redirect_to tournament_path(@tournament)
  end

  def generate_finalists
    @tournament = Tournament.find(params[:id])
    GenerateFinalistsService.new().generate(@tournament.id)
    redirect_to tournament_path(@tournament)
  end

  private
  def tournament_params
    params.require(:tournaments).permit(:name, :number_of_contestants, :tournament_type)
  end
end
