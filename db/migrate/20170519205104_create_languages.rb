class CreateLanguages < ActiveRecord::Migration[5.0]
  def self.up
    create_table :languages do |t|
      t.string :name
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :languages
  end
end
