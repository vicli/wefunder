# == Schema Information
#
# Table name: contestants
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  active        :boolean          default(TRUE)
#  name          :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Contestant < ApplicationRecord
  validates :tournament_id, presence: true
  belongs_to :tournament

  def self.active_contestants_for_tournament(tournament_id)
    Contestant.where(active: true, tournament_id: tournament_id)
  end

  def self.eliminate(loser_id)
    contestant = Contestant.find_by(id: loser_id)
    if contestant
      contestant.update_attributes(active: false)
    end
  end

  def self.check_winner_for_tournament(tournament_id)
    if Contestant.where(tournament_id: tournament_id, active: true).count == 1
      return Contestant.where(tournament_id: tournament_id, active: true).first
    end
  end
end
