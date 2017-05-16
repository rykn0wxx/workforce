# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  label      :string
#  path       :text
#  is_active  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true
  validates :label, presence: true
  validates :path, presence: true
  validates :is_active, presence: true

end
