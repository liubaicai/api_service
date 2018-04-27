class Blog::Category < ActiveRecord::Base
    has_many :articles
    self.table_name = :blog_categories

end
