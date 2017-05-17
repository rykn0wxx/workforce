# == Schema Information
#
# Table name: blocks
#
#  id         :integer          not null, primary key
#  report_id  :integer
#  name       :string
#  is_done    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_blocks_on_report_id  (report_id)
#

class Block < ApplicationRecord
  belongs_to :report
  has_many :cards
end
