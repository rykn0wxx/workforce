# == Schema Information
#
# Table name: reports
#
#  id           :integer          not null, primary key
#  project_id   :integer
#  name         :string
#  is_published :boolean          default(FALSE)
#  is_active    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_reports_on_project_id  (project_id)
#

class Report < ApplicationRecord
  belongs_to :project
  has_many :blocks
end
