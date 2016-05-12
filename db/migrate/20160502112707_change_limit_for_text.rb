class ChangeLimitForText < ActiveRecord::Migration
  def change
	change_column :articles, :text, :text, :limit => 16777214
  end
end
