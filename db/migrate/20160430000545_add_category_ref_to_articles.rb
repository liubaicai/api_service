class AddCategoryRefToArticles < ActiveRecord::Migration[4.2]
  def change
    add_reference :articles, :category, index: true, foreign_key: true
  end
end
