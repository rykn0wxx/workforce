class CreateBlocks < ActiveRecord::Migration[5.0]
  def self.up
    create_table :blocks do |t|
      t.references :report, foreign_key: true
      t.string :name
      t.boolean :is_done

      t.timestamps
    end
  end
  def self.down
    drop_table :blocks
  end
end
