ActiveAdmin.register Report do
  config.sort_order = 'updated_at_asc'
  permit_params :name, :project_id, :is_active, :is_published

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  form do |f|
    f.div :class => 'box_form' do
      f.inputs :name => 'Report Details' do
        f.input :project, :label => 'Project Associated', :input_html => {:class => 'form-control' }, :as => :select
        f.input :name, :label => 'Report', :input_html => {:class => 'form-control' }
        f.input :is_published, :label => 'Published'
        f.input :is_active, :label => 'Active'
      end
      f.actions
    end
  end

  sidebar 'Report Blocks', only: [:show, :edit] do
    ul do
      li link_to 'Blocks', admin_report_blocks_path(resource)
    end
  end

end
