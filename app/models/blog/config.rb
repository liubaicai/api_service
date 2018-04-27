class Blog::Config < ActiveRecord::Base
    self.table_name = :blog_configs
    
    def self.getValue key
        return Blog::Config.where(:sc_key=>key).take.sc_value
    end
    
    def self.setValue key,value
        item = Blog::Config.where(:sc_key=>key).take
        item.sc_value = value
        item.save
    end
    
end
