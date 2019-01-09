class ChangeLimitForText < ActiveRecord::Migration[4.2]
  def change
	change_column :articles, :text, :text, :limit => 16777214
  end
end
