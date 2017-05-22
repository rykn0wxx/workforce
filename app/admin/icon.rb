ActiveAdmin.register Icon do
  menu false
  config.sort_order = 'updated_at_asc'
  permit_params :name

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  filter :name

  active_admin_import validate: true, back: proc { config.namespace.resource_for(Icon).route_collection_path }

  index do
    selectable_column
    # id_column
    column 'Name', :name, sortable: :name do |dModel|
      link_to dModel.name, [:admin, dModel]
    end
    column :class => 'col-icon' do |dModel|
      span dModel.name, :class => 'material-icons'
    end
    column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
      dModel.updated_at.strftime('%d-%b %Y')
    end
    actions
  end

end
