class RemoveReqlogTable < ActiveRecord::Migration[4.2]
  def change
    drop_table :req_logs
  end
end
