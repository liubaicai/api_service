class Blog::Category < ActiveRecord::Base
    has_many :articles

end
