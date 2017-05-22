class CreateIcons < ActiveRecord::Migration[5.0]
  def self.up
    create_table :icons do |t|
      t.string :name

      t.timestamps
    end
  end
  def self.down
    drop_table :icons
  end
end
