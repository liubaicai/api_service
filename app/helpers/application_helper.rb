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
    
    def get_host
        'www.liubaicai.net'
    end

    def has_auth
        if cookies[:user_cookie] == Digest::MD5.hexdigest(Config.getValue('pwd'))
            return true
        else
            return false
        end
    end
    
end
