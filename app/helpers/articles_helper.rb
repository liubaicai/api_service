module ArticlesHelper
    
    def selectdefault category_id,current_id
        if category_id==current_id
            'selected="selected"'
        else
            ''
        end
    end

end
