# == Schema Information
#
# Table name: matches
#
#  id                   :integer          not null, primary key
#  round_id             :integer
#  active               :boolean          default(TRUE)
#  contestant_one_id    :integer          not null
#  contestant_two_id    :integer          not null
#  contestant_one_score :integer
#  contestant_two_score :integer
#  winner_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Match < ApplicationRecord
end
