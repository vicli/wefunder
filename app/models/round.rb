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
end
