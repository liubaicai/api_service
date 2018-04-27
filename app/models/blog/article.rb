class Blog::Article < ActiveRecord::Base
    belongs_to :category
    validates :title, presence: true, length: { minimum: 1 }
    self.per_page = 10
    self.table_name = :blog_articles

    def as_json(options)
        super(include: :category)
    end

end
