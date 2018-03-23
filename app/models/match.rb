# == Schema Information
#
# Table name: matches
#
#  id                   :integer          not null, primary key
#  round_id             :integer
#  active               :boolean          default(TRUE)
#  contestant_one_id    :integer          not null
#  contestant_two_id    :integer
#  contestant_one_score :integer
#  contestant_two_score :integer
#  winner_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  tournament_id        :integer          not null
#

class Match < ApplicationRecord
  has_many :contestants

  def matches_for_round(round)
    Match.where(round_id: round.id)
  end

  def update_match(one_score, two_score)
    self.update_attributes(
      contestant_one_score: one_score,
      contestant_two_score: two_score,
      winner_id: determine_winner_id(one_score, two_score),
      active: false
    )
  end

  def conclude_match
    loser_id = determine_loser_id(winner_id)
    Contestant.eliminate(loser_id)
  end

  private
  def determine_winner_id(one_score, two_score)
    if one_score > two_score
      return self.contestant_one_id
    else
      return self.contestant_two_id
    end
  end

  def determine_loser_id(winner_id)
    if contestant_one_id == winner_id
      return contestant_two_id
    else
      return contestant_one_id
    end
  end
end
