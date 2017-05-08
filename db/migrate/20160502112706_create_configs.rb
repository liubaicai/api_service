class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :sc_key
      t.string :sc_value
      t.string :sc_note

      t.timestamps null: false
    end
  end
end
