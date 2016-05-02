class SiteConfig < ActiveRecord::Base

    def self.getValue key
        SiteConfig.where(sc_key: key).take.sc_value
    end
    
    def self.setValue key,value
        item = SiteConfig.where(sc_key: key).take
        unless item.nil?
            item.sc_value = value
            item.save
        end
    end

end
