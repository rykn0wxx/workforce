ActiveAdmin.register UserAssignment do
  includes :user, :client
  config.sort_order = 'updated_at_asc'
  permit_params :name, :is_active

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  menu parent: 'User Maintenance'

  scope('No Assignments') { |scope| scope.where(client_id: nil) }

  form do |f|
    f.div :class => 'box_form' do
      f.inputs :name => 'User Client Assignment' do
        f.input :user, :label => 'User', :input_html => {:class => 'form-control' }, :as => :select
        f.input :client, :label => 'Client', :input_html => {:class => 'form-control' }, :as => :radio
        f.input :is_manager, :label => 'is Managing Client'
        f.input :is_active, :label => 'Active'
      end
      # f.inputs do
      #   f.has_many :client
      # end
      f.actions
    end
  end

end
