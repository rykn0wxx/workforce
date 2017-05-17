ActiveAdmin.register Client do
  active_admin_import validate: true,
    headers_rewrites: { :'project_name' => :project_id },
    before_batch_import: -> (importer) {
      project_names = importer.values_at(:project_id)
      parents = Project.where(name: project_names).pluck(:name, :id)
      options = Hash[*parents.flatten]
      importer.batch_replace(:project_id, options)
    },
    back: proc { config.namespace.resource_for(Client).route_collection_path }


  config.sort_order = 'updated_at_asc'
  permit_params :name, :code, :is_active, :parent

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  form do |f|
    f.div :class => 'box_form' do
      f.inputs :name => 'Client Info' do
        f.input :project, :label => 'Project', :input_html => {:class => 'form-control' }, :as => :select
        f.input :name, :label => 'Client Name', :input_html => {:class => 'form-control' }
        f.input :code, :label => 'Short Code', :input_html => {:class => 'form-control' }
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
    column 'Project', :project, sortable: :project
    column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
      dModel.updated_at.strftime('%d-%b %Y')
    end
    actions
  end

end
