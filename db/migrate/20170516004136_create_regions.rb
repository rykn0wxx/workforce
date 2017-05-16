class CreateRegions < ActiveRecord::Migration[5.0]
  def self.up
    create_table :regions do |t|
      t.string :name
      t.string :code
      t.string :label
      t.text :path
      t.boolean :is_active

      t.timestamps
    end
  end
  def self.down
    drop_table :regions
  end
end
