# == Schema Information
#
# Table name: rounds
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  active        :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  round_number  :integer          not null
#

class Round < ApplicationRecord
  validates :tournament_id, presence: true
  has_many :matches

  def self.current_round(tournament_id)
    Round.where(tournament_id: tournament_id).count
  end

  def conclude_round
    return false if Match.where(round_id: id, active: true).count > 0
    Round.transaction do
      self.update_attributes(active: false)
      Match.where(round_id: self.id).each do |mat|
        mat.conclude_match
      end
    end
  end
end
