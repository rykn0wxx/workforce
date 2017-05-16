ActiveAdmin.register Region do
  config.sort_order = 'updated_at_asc'
  permit_params :name, :code, :label, :path, :is_active

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  form do |f|
    f.div :class => 'box_form' do
      f.inputs :name => 'Region Details' do
        f.input :name, :label => 'Region', :input_html => {:class => 'form-control' }
        f.input :code, :label => 'Short Code', :input_html => {:class => 'form-control' }
        f.input :label, :label => 'Display Label', :input_html => {:class => 'form-control' }
        f.input :path, :label => 'SVG Path', :input_html => {:class => 'form-control' }
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
    column 'Code', :code, sortable: :code
    column 'Display Label', :label, sortable: :label
    column 'Active', :is_active
    column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
      dModel.updated_at.strftime('%d-%b %Y')
    end
    actions
  end

end
