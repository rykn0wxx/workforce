# == Schema Information
#
# Table name: card_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  is_active  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CardCategory < ApplicationRecord
  has_many :cards
  validates :name, presence: true
  validates :is_active, presence: true
end
