# == Schema Information
#
# Table name: tournament_contestant_stats
#
#  id            :integer          not null, primary key
#  contestant_id :integer          not null
#  tournament_id :integer          not null
#  wins          :integer          default(0)
#  losses        :integer          default(0)
#  delta         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TournamentContestantStat < ApplicationRecord

  def self.top_contestant_ids(tournament_id)
    TournamentContestantStat.where(tournament_id: tournament_id).order("delta DESC").limit(32).pluck(:contestant_id)
  end
end
