class CreateCards < ActiveRecord::Migration[5.0]
  def self.up
    create_table :cards do |t|
      t.references :block, foreign_key: true
      t.string :headline
      t.references :card_category, foreign_key: true
      t.text :content
      t.boolean :is_complete

      t.timestamps
    end
  end
  def self.down
    drop_table :cards
  end
end
