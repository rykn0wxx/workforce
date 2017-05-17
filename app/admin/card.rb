ActiveAdmin.register Card do
  belongs_to :block
  navigation_menu :block

  config.sort_order = 'updated_at_asc'
  permit_params :block_id, :headline, :card_category_id, :content, :is_complete

end

#  block_id         :integer
#  headline         :string
#  card_category_id :integer
#  content          :text
#  is_complete      :boolean
