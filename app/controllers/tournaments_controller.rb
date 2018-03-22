class TournamentsController < ApplicationController
  def index
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params.except(:number_of_contestants))
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
