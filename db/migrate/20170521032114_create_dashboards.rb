class CreateDashboards < ActiveRecord::Migration[5.0]
  def self.up
    create_table :dashboards do |t|
      t.references :parent_project, foreign_key: true
      t.string :title, null: false, default: ''
      t.text :body
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :dashboards
  end
end
