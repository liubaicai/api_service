class ChangeValueTypeInConfigs < ActiveRecord::Migration
  def change
	  change_column :configs, :sc_value, :text
  end
end
