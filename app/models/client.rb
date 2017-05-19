# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  project_id :integer
#  name       :string           default(""), not null
#  code       :string           default(""), not null
#  is_active  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clients_on_project_id  (project_id)
#

class Client < ApplicationRecord
  belongs_to :project
  has_many :user_assignments
  has_many :users, through: :user_assignments
  

  validates :name, presence: true
  validates :code, presence: true
  validates :is_active, presence: true
  validates :project, presence: true
end
