# == Schema Information
#
# Table name: cards
#
#  id               :integer          not null, primary key
#  block_id         :integer
#  headline         :string
#  card_category_id :integer
#  content          :text
#  is_complete      :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_cards_on_block_id          (block_id)
#  index_cards_on_card_category_id  (card_category_id)
#

class Card < ApplicationRecord
  belongs_to :block
  belongs_to :card_category
end
