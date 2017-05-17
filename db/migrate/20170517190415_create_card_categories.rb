class CreateCardCategories < ActiveRecord::Migration[5.0]
  def self.up
    create_table :card_categories do |t|
      t.string :name
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :card_categories
  end
end
