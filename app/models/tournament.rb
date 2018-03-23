# == Schema Information
#
# Table name: tournaments
#
#  id              :integer          not null, primary key
#  name            :string
#  active          :boolean          default(TRUE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tournament_type :string
#

class Tournament < ApplicationRecord
  TYPES = ['fooseball', 'ping_pong']
  has_many :rounds
  has_many :contestants

  validates :tournament_type, inclusion: { in: TYPES }

  accepts_nested_attributes_for :contestants

  def self.reset_tournament(tournament_id)
    Tournament.find(tournament_id).update_attributes(active: false)
    Round.where(tournament_id:tournament_id).each do |round|
      round.update_attributes(active: false)
    end

    Match.where(tournament_id: tournament_id).each do |mat|
      mat.update_attributes(active: false)
    end

    Contestant.where(tournament_id: tournament_id).each do |contestant|
      contestant.update_attributes(active: false)
    end
  end
end
