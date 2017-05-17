ActiveAdmin.register Project do
  belongs_to :parent_project
  navigation_menu :parent_project

  active_admin_import validate: true,
    headers_rewrites: { :'parent_project' => :parent_project_id },
    before_batch_import: -> (importer) {
      parproject_names = importer.values_at(:parent_project_id)
      parents = ParentProject.where(name: parproject_names).pluck(:name, :id)
      options = Hash[*parents.flatten]
      importer.batch_replace(:parent_project_id, options)
    },
    back: proc { config.namespace.resource_for(Project).route_collection_path }

  config.sort_order = 'updated_at_asc'
  permit_params :name, :is_active, :parent_project

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  form do |f|
    f.div :class => 'box_form' do
      f.inputs :name => 'Project Info' do
        f.input :parent_project, :label => 'Parent Project', :input_html => {:class => 'form-control' }, :as => :select
        f.input :name, :label => 'Project Name', :input_html => {:class => 'form-control' }
        f.input :is_active, :label => 'Active'
      end
      f.actions
    end
  end

  index do
    selectable_column
    # id_column
    column 'Name', :name, sortable: :name do |dModel|
      link_to dModel.name, [:admin, dModel.parent_project, dModel]
    end
    column 'Active', :is_active
    column 'Parent', :parent_project, sortable: :parent_project
    column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
      dModel.updated_at.strftime('%d-%b %Y')
    end
    actions
  end

  sidebar 'Project Clients', only: [:show, :edit] do
    ul do
      li link_to 'Clients', admin_project_clients_path(resource)
    end
  end

end
