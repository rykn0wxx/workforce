ActiveAdmin.register Language do
  config.sort_order = 'updated_at_asc'
  permit_params :name, :is_active

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  menu parent: 'General Dimensions'

  active_admin_import validate: true, back: proc { config.namespace.resource_for(Language).route_collection_path }

  form do |f|
    f.div :class => 'box_form' do
      f.inputs :name => 'Report Details' do
        f.input :name, :label => 'Language', :input_html => {:class => 'form-control' }
        f.input :is_active, :label => 'Active'
      end
      f.actions
    end
  end

  index do
    selectable_column
    # id_column
    column 'Name', :name, sortable: :name do |dModel|
      link_to dModel.name, [:admin, dModel]
    end
    column 'Active', :is_active
    column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
      dModel.updated_at.strftime('%d-%b %Y')
    end
    actions
  end

end
