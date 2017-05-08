class ReqLog < ActiveRecord::Base

    def self.insert(ip,url,method,ua)
        begin 
            log = ReqLog.new
            log.ip = ip
            log.url = url
            log.method = method
            log.ua = ua
            log.save
        rescue Exception => e
            puts e.to_s
        end
    end

end
