class Config < ActiveRecord::Base
    
    def self.getValue key
        cache_config = $cache_cache.read(key)
        if cache_config.nil?
            item = Config.where(:sc_key=>key).take
            if item.nil?
                $cache_cache.write(key,'')
                return ''
            else
                scvalue = Config.where(:sc_key=>key).take.sc_value
                $cache_cache.write(key,scvalue)
                return scvalue
            end
        else
          return cache_config
        end
    end
    
    def self.setValue key,value
        item = Config.where(:sc_key=>key).take
        item.sc_value = value
        item.save
        $cache_cache.write(key,value)
    end
    
end
