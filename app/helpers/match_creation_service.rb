class MatchCreationService
  def initalize
  end

  def create_matches_for_round(round)

    contestant_ids = determine_contestants_based_tournament_type(round)

    match_pairing_ids = contestant_ids.each_slice(2).to_a

    Match.transaction do
      match_pairing_ids.each do |pairing|
        if pairing.length == 2
          create_two_player_match(round, pairing)
        else
          create_one_player_match(round,pairing)
        end
      end
    end
  end

  private

  def create_two_player_match(round, pairing)
   Match.create(
      round_id: round.id,
      contestant_one_id: pairing[0],
      contestant_two_id: pairing[1],
      tournament_id: round.tournament_id
    )
  end

  def create_one_player_match(round, pairing)
    Match.create(
      round_id: round.id,
      contestant_one_id: pairing[0],
      contestant_two_id: nil,
      winner_id: pairing[0],
      contestant_one_score: nil,
      contestant_two_score: nil,
      active: false,
      tournament_id: round.tournament_id
    )
  end

  def determine_contestants_based_tournament_type(round)
    tournament = Tournament.find(round.tournament_id)

    if tournament.tournament_type == 'fooseball'
      Contestant.active_contestants_for_tournament(round.tournament_id).pluck(:id)
    else
      TournamentContestantStat.top_contestant_ids(round.tournament_id)
    end
  end
end