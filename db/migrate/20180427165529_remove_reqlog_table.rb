class RemoveReqlogTable < ActiveRecord::Migration
  def change
    drop_table :req_logs
  end
end
