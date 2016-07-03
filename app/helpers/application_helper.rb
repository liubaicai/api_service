module ApplicationHelper

    def get_hot_articles
        cache = $cache_cache.read('get_hot_articles')
        if cache.nil?
            articles = Article.limit(5).order('views DESC')
            $cache_cache.write('get_hot_articles',articles,:expires_in=>1.hours)
            articles
        else
            cache
        end
    end

    def get_categories
        cache = $cache_cache.read('get_categories')
        if cache.nil?
            categories = Category.all
            $cache_cache.write('get_categories',categories)
            categories
        else
            cache
        end
    end
    
    def get_links
        cache = $cache_cache.read('get_links')
        if cache.nil?
            links = Link.all.order('sort DESC')
            $cache_cache.write('get_links',links)
            links
        else
            cache
        end
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
