# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  parent_project_id :integer
#  name              :string           default(""), not null
#  is_active         :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_projects_on_parent_project_id  (parent_project_id)
#

class Project < ApplicationRecord
  belongs_to :parent_project
  has_many :clients

  validates :name, presence: true
  validates :is_active, presence: true
  validates :parent_project, presence: true
end
