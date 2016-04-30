class Article < ActiveRecord::Base
    belongs_to :category
    validates :title, presence: true, length: { minimum: 1 }
    self.per_page = 10
end
