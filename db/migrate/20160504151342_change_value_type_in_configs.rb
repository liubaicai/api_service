class ChangeValueTypeInConfigs < ActiveRecord::Migration[4.2]
  def change
	  change_column :configs, :sc_value, :text
  end
end
