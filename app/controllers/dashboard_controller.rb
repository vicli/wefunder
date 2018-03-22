class DashboardController < ApplicationController
  def index
    @tournament = current_tournament
    @contestants = Contestant.active_for_tournament(@tournament.id)
  end
end
