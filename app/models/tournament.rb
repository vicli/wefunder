# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tournament < ApplicationRecord
  has_many :rounds
  has_many :contestants

  accepts_nested_attributes_for :contestants
end
