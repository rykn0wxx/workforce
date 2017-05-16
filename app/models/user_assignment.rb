# == Schema Information
#
# Table name: user_assignments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  client_id  :integer
#  is_manager :boolean          default(FALSE)
#  is_active  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_assignments_on_client_id  (client_id)
#  index_user_assignments_on_user_id    (user_id)
#

class UserAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :client
end
