class Config < ActiveRecord::Base
    
    def self.getValue key
        Config.where(:sc_key=>key).take.sc_value
    end
    
    def self.setValue key,value
        item = Config.where(:sc_key=>key).take
        item.sc_value = value
        item.save
    end
    
end
