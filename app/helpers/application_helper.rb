module ApplicationHelper

    def get_categories
        categories = Category.all
        categories
    end
    
    def get_links
        links = Link.all.order('sort DESC')
        links
    end
    
    def get_slide_content
        content = Config.getValue('slide_content')
        content
    end
  
    def auth
        true
    end
    
end
