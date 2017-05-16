# == Schema Information
#
# Table name: parent_projects
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  is_active  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ParentProject < ApplicationRecord
  has_many :projects
end
