# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string
#  is_active  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ApplicationRecord
  has_many :phone_facts

  validates :name, presence: true
  validates :is_active, presence: true
end
