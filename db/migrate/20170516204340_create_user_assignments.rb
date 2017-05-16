class CreateUserAssignments < ActiveRecord::Migration[5.0]
  def self.up
    create_table :user_assignments do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.boolean :is_manager, default: false
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :user_assignments
  end
end
