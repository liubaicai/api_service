module ApplicationHelper

    def get_categories
        categories = Category.all
        categories
    end
  
    def auth
        true
    end
    
end
