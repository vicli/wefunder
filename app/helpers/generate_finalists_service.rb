class GenerateFinalistsService
  def intialize
  end
  def generate(tournament_id)
    @tournament_id = tournament_id
    Contestant.where(tournament_id: tournament_id).each do |contestant|
      play_rounds(contestant)
    end

    create_finalists(tournament_id)
  end

  def play_rounds(contestant)
    @all_contestants = Contestant.where(tournament_id: @tournament_id).pluck(:id)

    score_record = []

    opponent = @all_contestants.sample

    while opponent == contestant.id
      opponent = @all_contestants.sample
    end

    while score_record.length != 10
      score_record.push(play())
    end

    wins = score_record.sum
    losses = 10 - score_record.sum
    TournamentContestantStat.create(contestant_id: contestant.id, tournament_id: @tournament_id, wins: wins, losses: losses,  delta: wins-losses)
  end

  def create_finalists(tournament_id)
      Contestant.where.not(id: TournamentContestantStat.top_contestant_ids(tournament_id)).each do |contestant|
        contestant.update_attributes(active:false)
      end
  end
  private

  def play
    [0, 1].sample
  end
end