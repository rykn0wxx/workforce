ActiveAdmin.register Block do
  belongs_to :report
  navigation_menu :report

  config.sort_order = 'updated_at_asc'
  permit_params :name, :report_id, :is_done

  sidebar 'Card List', only: [:show, :edit] do
    ul do
      li link_to 'Cards', admin_block_cards_path(resource)
    end
  end
end
