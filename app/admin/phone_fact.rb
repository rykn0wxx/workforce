ActiveAdmin.register PhoneFact do

  config.sort_order = 'updated_at_asc'
  permit_params :parent_project_id, :record_date, :language_id, :calls_off, :calls_ans, :calls_ans30, :calls_abn, :calls_abn30, :time_talk, :time_hold, :time_wrap, :queue_ans, :queue_max

  preserve_default_filters!
  remove_filter :created_at, :updated_at

  active_admin_import validate: true,
    headers_rewrites: { :'parent_project' => :parent_project_id, :'language' => :language_id },
    before_batch_import: -> (importer) {
      pp_names = importer.values_at(:parent_project_id)
      pp = ParentProject.where(name: pp_names).pluck(:name, :id)
      pp_options = Hash[*pp.flatten]
      importer.batch_replace(:parent_project_id, pp_options)

      pl_names = importer.values_at(:language_id)
      pl_parents = Language.where(name: pl_names).pluck(:name, :id)
      pl_options = Hash[*pl_parents.flatten]
      importer.batch_replace(:language_id, pl_options)
    },
    back: proc { config.namespace.resource_for(PhoneFact).route_collection_path }

end
