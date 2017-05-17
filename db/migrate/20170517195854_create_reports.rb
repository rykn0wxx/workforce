class CreateReports < ActiveRecord::Migration[5.0]
  def self.up
    create_table :reports do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.boolean :is_published, default: false
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :reports
  end
end
