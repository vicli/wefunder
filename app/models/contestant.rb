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
end
