# == Schema Information
#
# Table name: dashboards
#
#  id                :integer          not null, primary key
#  parent_project_id :integer
#  title             :string           default(""), not null
#  body              :text
#  is_active         :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_dashboards_on_parent_project_id  (parent_project_id)
#

class Dashboard < ApplicationRecord
  belongs_to :parent_project

  validates :parent_project, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true
  validates :is_active, presence: true
end
