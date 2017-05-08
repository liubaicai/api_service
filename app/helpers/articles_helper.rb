module ArticlesHelper
    
    def selectdefault category_id,current_id
        if category_id==current_id
            'selected="selected"'
        else
            ''
        end
    end

  def select_all_articles
      return Article.all.order('created_at DESC')
  end

end
