class CreateParentProjects < ActiveRecord::Migration[5.0]
  def self.up
    create_table :parent_projects do |t|
      t.string :name, null: false, default: ""
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :parent_projects
  end
end
