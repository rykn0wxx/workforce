ActiveAdmin.register PhoneFact do

  config.sort_order = 'updated_at_asc'
  permit_params :parent_project_id, :record_date, :language_id, :calls_off, :calls_ans, :calls_ans30, :calls_abn, :calls_abn30, :time_talk, :time_hold, :time_wrap, :queue_ans, :queue_max

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  active_admin_import validate: true,
    before_batch_import: -> (importer) {
      parent_project_names = importer.values_at(:parent_project_id)
      project_parents = ParentProject.where(name: parent_project_names).pluck(:name, :id)
      project_options = Hash[*project_parents.flatten]
      importer.batch_replace(:parent_project_id, project_options)

      parent_language_names = importer.values_at(:language_id)
      language_parents = Language.where(name: parent_language_names).pluck(:name, :id)
      language_options = Hash[*language_parents.flatten]
      importer.batch_replace(:language_id, language_options)
    },
    back: proc { config.namespace.resource_for(PhoneFact).route_collection_path }

end
