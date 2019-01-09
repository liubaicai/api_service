class RenameTableToBlog < ActiveRecord::Migration[4.2]
  def change
    rename_table :articles, :blog_articles
    rename_table :categories, :blog_categories
    rename_table :configs, :blog_configs
    rename_table :links, :blog_links
  end
end
