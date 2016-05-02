module ApplicationHelper

    def get_categories
        categories = Category.all
        categories
    end
    
    def get_links
        links = Link.all.order('sort DESC')
        links
    end
  
    def auth
        true
    end
    
end
