class CreatePhoneFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_facts do |t|
      t.references :parent_project, foreign_key: true
      t.date :record_date, null: false
      t.references :language, foreign_key: true
      t.integer :calls_off, null: false, default: 0
      t.integer :calls_ans, null: false, default: 0
      t.integer :calls_ans30, null: false, default: 0
      t.integer :calls_abn, null: false, default: 0
      t.integer :calls_abn30, null: false, default: 0
      t.integer :time_talk, null: false, default: 0
      t.integer :time_hold, null: false, default: 0
      t.integer :time_wrap, null: false, default: 0
      t.integer :queue_ans, null: false, default: 0
      t.integer :queue_max, null: false, default: 0

      t.timestamps
    end
  end
  def self.down
    drop_table :phone_facts
  end
end
