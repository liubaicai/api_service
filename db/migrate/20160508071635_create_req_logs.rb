class CreateReqLogs < ActiveRecord::Migration
  def change
    create_table :req_logs do |t|
      t.string :ip
      t.string :url,:limit => 250
      t.string :method
      t.string :ua,:limit => 250

      t.timestamps null: false
    end
  end
end
