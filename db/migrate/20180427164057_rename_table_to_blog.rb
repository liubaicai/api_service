class RenameTableToBlog < ActiveRecord::Migration
  def change
    rename_table :articles, :blog_articles
    rename_table :categories, :blog_categories
    rename_table :configs, :blog_configs
    rename_table :links, :blog_links
  end
end
