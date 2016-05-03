class Config < ActiveRecord::Base
    
    def self.getValue key
        item = Config.where(:sc_key=>key).take
        if item.nil?
            ''
        else
            Config.where(:sc_key=>key).take.sc_value
        end
    end
    
    def self.setValue key,value
        item = Config.where(:sc_key=>key).take
        item.sc_value = value
        item.save
    end
    
end
