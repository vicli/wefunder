class ContestantsController < ApplicationController


  def index
  end

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @num_contestants = params[:number_of_contestants]
    @contestants = []
    @num_contestants.to_i.times {
      @contestants.push(Contestant.new)
    }
  end

  def create
    @contestants = []
    params[:contestants].each do |contestant|
      @contestants.push(Contestant.new(email: contestant[:email],
        name: contestant[:name], tournament_id: current_tournament.id))
    end
    if @contestants.each(&:save)
      redirect_to root_path
    else
      flash[:notice] = 'Contestants cannot be created'
      redirect_to 'new'
      p "no"
    end
  end
end
