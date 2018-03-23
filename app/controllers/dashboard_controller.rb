class DashboardController < ApplicationController
  def index
    @tournament = current_tournament
    if @tournament
      @has_generated_contestants = TournamentContestantStat.where(tournament_id: @tournament.id).count >0
      @contestants = Contestant.active_contestants_for_tournament(@tournament.id)
      @current_round = Round.current_round(@tournament.id)
      @winner = Contestant.check_winner_for_tournament(@tournament.id)
    end
  end
end
