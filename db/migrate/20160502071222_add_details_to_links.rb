class AddDetailsToLinks < ActiveRecord::Migration[4.2]
  def change
    add_column :links, :sort, :integer
  end
end
