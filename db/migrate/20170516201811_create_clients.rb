class CreateClients < ActiveRecord::Migration[5.0]
  def self.up
    create_table :clients do |t|
      t.references :project, foreign_key: true
      t.string :name, null: false, default: ""
      t.string :code, null: false, default: ""
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :clients
  end
end
