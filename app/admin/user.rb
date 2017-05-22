ActiveAdmin.register User do
  config.sort_order = 'updated_at_asc'

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  menu parent: 'User Maintenance'

  scope('Unassigned') { |scope| scope.joins(user_assignments: :client).where('clients.id' => nil) }

  index do
    selectable_column
    # id_column
    column 'Email', :nemailame, sortable: :email do |dModel|
      link_to dModel.email, [:admin, dModel]
    end
    column 'Username', :username, sortable: :username
    column 'Sign in Count', :sign_in_count, sortable: :sign_in_count
    column 'Last Sign In', :last_sign_in_at, :sortable => :last_sign_in_at do |dModel|
      dModel.last_sign_in_at.strftime('%d-%b %Y')
    end
    column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
      dModel.updated_at.strftime('%d-%b %Y')
    end
    actions
  end


end
