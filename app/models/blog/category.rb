class Blog::Category < ApplicationRecord
    has_many :articles
    self.table_name = :blog_categories

end
